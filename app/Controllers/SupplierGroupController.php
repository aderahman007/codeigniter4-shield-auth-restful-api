<?php

namespace App\Controllers;

use App\Controllers\BaseApiController;

class SupplierGroupController extends BaseApiController
{
    protected $format       = 'json';
    protected $modelName    = 'App\Models\SupplierGroupModel';
    protected $validation;

    public function __construct()
    {
        $this->validation = \Config\Services::validation();
        helper(['general', 'form']);
    }

    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    public function index()
    {
        $query = $this->model->findAll();

        $msg = [
            'status'        => 200,
            'message'       => 'Semua data group suplier',
            'data'          => ['suppliergroup' => $query],
        ];
        return $this->respond($msg, 200);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        $query = $this->model->find($id);

        if ($query) {
            $msg = [
                'status'        => 200,
                'message'       => 'Data supplier group by id',
                'data'          => ['suppliergroup' => $query],
            ];
        } else {
            $msg = [
                'status'        => 404,
                'message'       => 'Data tidak ditemukan',
                'data'          => [],
            ];
        }
        return $this->respond($msg, $msg['status']);
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
            'description' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Deskripsi harus di isi'
                ]
            ],
            
        ]);

        if (!$validasi) {
            $msg = [
                'status'        => 500,
                'message'       => 'Validation error',
                'data' => [
                    'description' => $this->validation->getError('description'),
                ]
            ];
        } else {
            $data = [
                'id' => get_kode('suppliergroup', 'id', 'SG'),
                'description' => $this->request->getVar('description'),
                'parent' => $this->request->getVar('parent'),
                'isgroup' => $this->request->getVar('group'),
                'payableacc' => $this->request->getVar('payableacc'),
                'downpaymentacc' => $this->request->getVar('downpaymentacc'),
                'purchasediscacc' => $this->request->getVar('purchasediscacc'),
                'gainlosspayableacc' => $this->request->getVar('gainlosspayableacc'),
                'usercreate' => '',
                'created_at' => date('Y-m-d H:i:s'),
            ];

            $created = $this->model->insert($data);

            if ($created) {
                $msg = [
                    'status'        => 200,
                    'message'       => 'Data berhasil di buat',
                    'data'          => [],
                ];
            }else {
                $msg = [
                    'status'        => 500,
                    'message'       => 'Data gagal di buat',
                    'data'          => [],
                ];
            }
        }

        return $this->respond($msg, $msg['status']);
    }

    /**
     * Return the editable properties of a resource object
     *
     * @return mixed
     */
    public function edit($id = null)
    {
        $query = $this->model->find($id);

        if ($query) {
            $msg = [
                'status'        => 200,
                'message'       => 'Edit supplier group',
                'data'          => ['suppliergroup' => $query],
            ];
        } else {
            $msg = [
                'status'        => 404,
                'message'       => 'Data tidak ditemukan',
                'data'          => [],
            ];
        }
        return $this->respond($msg, $msg['status']);
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        $validasi = $this->validate([
            'description' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Deskripsi harus di isi'
                ]
            ],
            
        ]);

        if (!$validasi) {
            $msg = [
                'status'        => 500,
                'message'       => 'Validation error',
                'data' => [
                    'description' => $this->validation->getError('description'),
                ]
            ];
        } else {
            $data = [
                'description' => $this->request->getVar('description'),
                'parent' => $this->request->getVar('parent'),
                'isgroup' => $this->request->getVar('group'),
                'payableacc' => $this->request->getVar('payableacc'),
                'downpaymentacc' => $this->request->getVar('downpaymentacc'),
                'purchasediscacc' => $this->request->getVar('purchasediscacc'),
                'gainlosspayableacc' => $this->request->getVar('gainlosspayableacc'),
                'usercreate' => '',
                'updated_at' => date('Y-m-d H:i:s'),
            ];
            $this->model->update(['id' => $id], $data);

            if ($this->model->affectedRows()) {
                $msg = [
                    'status'        => 200,
                    'message'       => 'Data berhasil di update',
                    'data'          => [],
                ];
            }else{
                $msg = [
                    'status'        => 500,
                    'message'       => 'Data gagal di update',
                    'data'          => [],
                ];
            }
        }

        return $this->respond($msg, $msg['status']);
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    public function delete($id = null)
    {
        $deleted = $this->model->delete($id);

        if ($deleted) {
            $msg = [
                'status'        => 200,
                'message'       => 'Data berhasil di hapus',
                'data'          => [],
            ];
        }else {
            $msg = [
                'status'        => 500,
                'message'       => 'Data gagal dihapus',
                'data'          => [],
            ];
            
        }
        return $this->respond($msg, $msg['status']);
    }
}
