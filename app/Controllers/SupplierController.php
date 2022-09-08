<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Models\SupplierModel;

class SupplierController extends ResourceController
{

    protected $modelName = 'App\Models\SupplierModel';
    protected $format    = 'json';
    protected $supplierModel;
    protected $validation;


    public function __construct()
    {
        $this->validation = \Config\Services::validation();
    }


    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $suppliers = $this->model->findAll();
        $data = [
            'status' => 200,
            'message' => '',
            'data' => $suppliers,
        ];

        return $this->respond($data, 200);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        $suppliers = $this->model->find($id);
        $data = [
            'status' => 200,
            'message' => '',
            'data' => $suppliers,
        ];

        return $this->respond($data, 200);
    }

    /**
     * Return a new resource object, with default properties
     *
     * @return mixed
     */
    public function new()
    {
        //
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    public function create()
    {

        // $id = $this->request->getPost('id');
        $validasi = $this->validate([
            'name' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Nama Harus di isi'
                ],
            ],
            'suppliergroup' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Supplier-Group Harus di isi'
                ],
            ],
        ]);
        if ($validasi) {
            $data = $this->request->getPost();
            $data['id'] = get_kode('supplier', 'id', 'SP');

            if ($this->model->save($data)) {
                $msg = [
                    'status' => 200,
                    'message' => 'Supplier berhasil ditambah',
                    'data' => $data,
                ];
                return $this->respond($msg, 200);
            } else {
                $msg = [
                    'status' => 500,
                    'message' => 'Supplier gagal ditambah',
                    'data' => [],
                ];
                return $this->respond($msg, 500);
            }
        } else {
            $msg = [
                'status' => 500,
                'message' => 'Validasi error',
                'data' => [
                    'name' => $this->validation->getError('name'),
                    'suppliergroup' => $this->validation->getError('suppliergroup'),
                ],
            ];
            return $this->respond($msg, 500);
        }
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        $validasi = $this->validate([
            'name' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Nama Harus di isi'
                ],
            ],
        ]);
        if ($validasi) {
            $data = $this->request->getRawInput();
            $data['id'] = $id;

            if ($this->model->save($data)) {
                $msg = [
                    'status' => 200,
                    'message' => 'Supplier berhasil diubah',
                    'data' => $data,
                ];
                return $this->respond($msg, 200);
            } else {
                $msg = [
                    'status' => 500,
                    'message' => 'Supplier gagal diubah',
                    'data' => [],
                ];
                return $this->respond($msg, 500);
            }
        } else {
            $msg = [
                'status' => 500,
                'message' => 'Validasi error',
                'data' => [
                    'name' => $this->validation->getError('name'),
                    'suppliergroup' => $this->validation->getError('suppliergroup'),
                ],
            ];
            return $this->respond($msg, 500);
        }
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        $delete = $this->model->delete($id);
        if ($this->model->db->affectedRows() === 0) {
            $msg = [
                'status' => 404,
                'message' => 'Supplier dengan id ' . $id . ' tidak ditemukan atau sudah dihapus',
                'data' => [],
            ];
            return $this->respond($msg, 404);
        }
        $msg = [
            'status' => 200,
            'message' => 'Supplier berhasil dihapus',
            'data' => [],
        ];
        return $this->respond($msg, 200);
    }
}
