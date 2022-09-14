<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;

class PurchaseDetailController extends ResourceController
{

    protected $modelName = 'App\Models\PurchaseDetailModel';
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
        $purchasedetail = $this->model->findAll();
        $data = [
            'status' => 200,
            'message' => '',
            'data' => ['purchasedetail' => $purchasedetail],
        ];

        return $this->respond($data, 200);
    }

    public function showPurchaseDetail($purchaseid = null)
    {
        $purchasedetail = $this->model->where('purchaseid', $purchaseid)->findAll();
        if ($purchasedetail) {
            $data = [
                'status' => 200,
                'message' => '',
                'data' => ['purchasedetail' => $purchasedetail],
            ];
            return $this->respond($data, 200);
        } else {
            $data = [
                'status' => 404,
                'message' => 'Data tidak ditemukan',
                'data' => [],
            ];
            return $this->respond($data, 404);
        }
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    public function show($id = null)
    {
        $purchasedetail = $this->model->find($id);
        if ($purchasedetail) {
            $data = [
                'status' => 200,
                'message' => 'Data purchase sdetail by id',
                'data' => ['purchasedetail' => $purchasedetail],
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
            'purchaseid' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Purchase Harus di isi'
                ],
            ],
            'productid' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Product Harus di isi'
                ],
            ],
            'departement' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Departement Harus di isi'
                ],
            ],
            'unit' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Unit Harus di isi'
                ],
            ],
            'taxid' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Tax Harus di isi'
                ],
            ],
            'purchaseidref' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Purchase ref Harus di isi'
                ],
            ],
            'price' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Price Harus di isi'
                ],
            ],
        ]);
        if ($validasi) {
            $data =  (array) $this->request->getVar();
            $data['id'] = get_kode('purchasedetail', 'id', 'PD');
            // return $this->respond($data, 200);
            // print_r($data);
            // die;
            // die;
            if ($this->model->save($data)) {
                $msg = [
                    'status' => 200,
                    'message' => 'Purchase Detail berhasil ditambah',
                    'data' => $data,
                ];
                return $this->respond($msg, 200);
            } else {
                $msg = [
                    'status' => 500,
                    'message' => 'Purchasing Detail gagal ditambah',
                    'data' => [],
                ];
                return $this->respond($msg, 500);
            }
        } else {
            $msg = [
                'status' => 500,
                'message' => 'Validasi error',
                'data' => [
                    'purchaseid' => $this->validation->getError('purchaseid'),
                    'productid' => $this->validation->getError('productid'),
                    'departement' => $this->validation->getError('departement'),
                    'unit' => $this->validation->getError('unit'),
                    'taxid' => $this->validation->getError('taxid'),
                    'purchaseidref' => $this->validation->getError('purchaseidref'),
                    'price' => $this->validation->getError('price'),

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
            'purchaseid' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Purchase Harus di isi'
                ],
            ],
            'productid' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Product Harus di isi'
                ],
            ],
            'departement' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Departement Harus di isi'
                ],
            ],
            'unit' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Unit Harus di isi'
                ],
            ],
            'taxid' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Tax Harus di isi'
                ],
            ],
            'purchaseidref' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Purchase ref Harus di isi'
                ],
            ],
            'price' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Price Harus di isi'
                ],
            ],
        ]);
        if ($validasi) {
            $data =  (array) $this->request->getVar();
            $data['id'] = $id;

            if ($this->model->update(['id' => $id], $data)) {
                $msg = [
                    'status' => 200,
                    'message' => 'Purchase Detail berhasil diubah',
                    'data' => $data,
                ];
                return $this->respond($msg, 200);
            } else {
                $msg = [
                    'status' => 500,
                    'message' => 'Purchasing Detail gagal diubah',
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
                'message' => 'Purchase detail dengan id ' . $id . ' tidak ditemukan atau sudah dihapus',
                'data' => [],
            ];
            return $this->respond($msg, 404);
        }
        $msg = [
            'status' => 200,
            'message' => 'Purchase detail berhasil dihapus',
            'data' => [],
        ];
        return $this->respond($msg, 200);
    }
}
