<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;

class PurchaseController extends ResourceController
{

    protected $modelName = 'App\Models\PurchaseModel';
    protected $format    = 'json';
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
        $purchase = $this->model->findAll();
        $data = [
            'status' => 200,
            'message' => '',
            'data' => ['purchase' => $purchase],
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
        $purchase = $this->model->find($id);
        if ($purchase) {
            $data = [
                'status' => 200,
                'message' => 'Data purchase by id',
                'data' => ['purchase' => $purchase],
            ];
        } else {
            $data = [
                'status' => 404,
                'message' => 'Data tidak ditemukan',
                'data' => [],
            ];
        }

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
        $validasi = $this->validate([
            'division' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Division Harus di isi'
                ],
            ],
            'purchaser' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Purchaser Harus di isi'
                ],
            ],
            'supplierid' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'ID Suplier Harus di isi'
                ],
            ],
            'shipment' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Shipment Harus di isi'
                ],
            ],
        ]);
        if ($validasi) {
            $data =  (array) $this->request->getVar();
            $data['id'] = get_kode('purchase', 'id', 'PCH');
            // return $this->respond($data, 200);
            // print_r($data);
            // die;
            // die;
            if ($this->model->save($data)) {
                $msg = [
                    'status' => 200,
                    'message' => 'Purchasing berhasil ditambah',
                    'data' => $data,
                ];
                return $this->respond($msg, 200);
            } else {
                $msg = [
                    'status' => 500,
                    'message' => 'Purchasing gagal ditambah',
                    'data' => [],
                ];
                return $this->respond($msg, 500);
            }
        } else {
            $msg = [
                'status' => 500,
                'message' => 'Validasi error',
                'data' => [
                    'division' => $this->validation->getError('division'),
                    'purchaser' => $this->validation->getError('purchaser'),
                    'supplierid' => $this->validation->getError('supplierid'),
                    'shipment' => $this->validation->getError('shipment'),

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
        $data = (array) $this->request->getVar();
        $data['id'] = $id;

        if ($this->model->update(['id' => $id], $data)) {
            $msg = [
                'status' => 200,
                'message' => 'Purchase berhasil diubah',
                'data' => $data,
            ];
            return $this->respond($msg, 200);
        } else {
            $msg = [
                'status' => 500,
                'message' => 'Purchase gagal diubah',
                'data' => [],
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
        $this->model->delete($id);
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
