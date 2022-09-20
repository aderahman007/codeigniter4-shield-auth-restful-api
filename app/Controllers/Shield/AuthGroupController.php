<?php

namespace App\Controllers\Shield;

use App\Controllers\BaseApiController;

class AuthGroupController extends BaseApiController
{
    protected $format       = 'json';
    protected $modelName    = 'App\Models\Shield\AuthGroupModel';
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
            'message'       => 'Semua data group users',
            'data'          => ['auth_groups' => $query],
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
                'message'       => 'Data auth group by id',
                'data'          => ['auth_group' => $query],
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
            'group_name' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Nama group harus di isi'
                ]
            ],
            'title' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Title harus di isi'
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
                    'group_name' => $this->validation->getError('group_name'),
                    'title' => $this->validation->getError('title'),
                    'description' => $this->validation->getError('description'),
                ]
            ];
        } else {
            $data = [
                'group_name' => strtolower($this->request->getVar('group_name')),
                'title' => $this->request->getVar('title'),
                'description' => $this->request->getVar('description'),
                'created_at' => date('Y-m-d H:i:s'),
            ];

            $created = $this->model->save($data);

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
            'group_name' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Nama group harus di isi'
                ]
            ],
            'title' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Title harus di isi'
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
                    'group_name' => $this->validation->getError('group_name'),
                    'title' => $this->validation->getError('title'),
                    'description' => $this->validation->getError('description'),
                ]
            ];
        } else {
            $data = [
                'group_name' => strtolower($this->request->getVar('group_name')),
                'title' => $this->request->getVar('title'),
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
