<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;

class UnitController extends ResourceController
{

    protected $modelName = 'App\Models\UnitModel';
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
        $unit = $this->model->findAll();
        $data = [
            'status' => 200,
            'message' => '',
            'data' => ['unit' => $unit],
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
        $unit = $this->model->find($id);
        if ($unit) {
            $data = [
                'status' => 200,
                'message' => 'Data unit by id',
                'data' => ['unit' => $unit],
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
            'unit' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Unit Harus di isi'
                ],
            ],

        ]);
        if ($validasi) {
            $data =  (array) $this->request->getVar();
            $data['id'] = get_kode('units', 'id', 'UN');
            // return $this->respond($data, 200);
            // print_r($data);
            // die;
            // die;
            if ($this->model->save($data)) {
                $msg = [
                    'status' => 200,
                    'message' => 'Unit berhasil ditambah',
                    'data' => $data,
                ];
                return $this->respond($msg, 200);
            } else {
                $msg = [
                    'status' => 500,
                    'message' => 'Unit gagal ditambah',
                    'data' => [],
                ];
                return $this->respond($msg, 500);
            }
        } else {
            $msg = [
                'status' => 500,
                'message' => 'Validasi error',
                'data' => [
                    'unit' => $this->validation->getError('unit '),
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
        //
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    public function update($id = null)
    {
        $validasi = $this->validate([
            'unit' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Unit Harus di isi'
                ],
            ],
        ]);
        if ($validasi) {
            $data = (array) $this->request->getVar();
            $data['id'] = $id;

            if ($this->model->update(['id' => $id], $data)) {
                $msg = [
                    'status' => 200,
                    'message' => 'Unit berhasil diubah',
                    'data' => $data,
                ];
                return $this->respond($msg, 200);
            } else {
                $msg = [
                    'status' => 500,
                    'message' => 'Unit gagal diubah',
                    'data' => [],
                ];
                return $this->respond($msg, 500);
            }
        } else {
            $msg = [
                'status' => 500,
                'message' => 'Validasi error',
                'data' => [
                    'unit' => $this->validation->getError('unit'),
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
        $this->model->delete($id);
        if ($this->model->db->affectedRows() === 0) {
            $msg = [
                'status' => 404,
                'message' => 'Unit dengan id ' . $id . ' tidak ditemukan atau sudah dihapus',
                'data' => [],
            ];
            return $this->respond($msg, 404);
        }
        $msg = [
            'status' => 200,
            'message' => 'Unit berhasil dihapus',
            'data' => [],
        ];
        return $this->respond($msg, 200);
    }
}
