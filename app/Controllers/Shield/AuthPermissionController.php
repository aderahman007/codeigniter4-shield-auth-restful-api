<?php

namespace App\Controllers\Shield;

use App\Controllers\BaseApiController;

class AuthPermissionController extends BaseApiController
{
    protected $format       = 'json';
    protected $modelName    = 'App\Models\Shield\AuthPermissionModel';
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
            'message'       => 'Semua data auth permission',
            'data'          => ['auth_permission' => $query],
        ];
        return $this->respond($msg, $msg['status']);
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
                'message'       => 'Data auth permission by id',
                'data'          => ['auth_permission' => $query],
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
            'permission_name' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Nama permission harus di isi'
                ]
            ],
            'authorization' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Authorization harus di isi'
                ]
            ],
            'description' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Description harus di isi'
                ]
            ],
            
        ]);

        if (!$validasi) {
            $msg = [
                'status'        => 500,
                'message'       => 'Validation error',
                'data' => [
                    'permission_name' => $this->validation->getError('permission_name'),
                    'authorization' => $this->validation->getError('authorization'),
                    'description' => $this->validation->getError('description'),
                ]
            ];
        } else {
            $data = [
                'permission_name' => strtolower($this->request->getVar('permission_name')),
                'authorization' => $this->request->getVar('authorization'),
                'description' => $this->request->getVar('description'),
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
            'permission_name' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Nama permission harus di isi'
                ]
            ],
            'authorization' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Authorization harus di isi'
                ]
            ],
            'description' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Description harus di isi'
                ]
            ],

        ]);


        if (!$validasi) {
            $msg = [
                'status'        => 500,
                'message'       => 'Validation error',
                'data' => [
                    'permission_name' => $this->validation->getError('permission_name'),
                    'authorization' => $this->validation->getError('authorization'),
                    'description' => $this->validation->getError('description'),
                ]
            ];
        } else {
            $data = [
                'permission_name' => strtolower($this->request->getVar('permission_name')),
                'authorization' => $this->request->getVar('authorization'),
                'description' => $this->request->getVar('description'),
                'created_at' => date('Y-m-d H:i:s'),
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
        $this->model->delete($id);

        if ($this->model->affectedRows()) {
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
