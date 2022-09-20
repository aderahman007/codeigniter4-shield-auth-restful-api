<?php

namespace App\Controllers\Shield;

use App\Controllers\BaseApiController;
use CodeIgniter\Shield\Entities\User;
use CodeIgniter\Shield\Models\UserModel;

class UsersController extends BaseApiController
{
    protected $usersModel;
    protected $usersEntity;
    protected $validation;

    public function __construct()
    {
        $this->validation = \Config\Services::validation();

        $this->usersEntity = new User();
        $this->usersModel = new UserModel();
        helper(['general', 'form']);
    }


    public function index()
    {
        $query = $this->usersModel->findAll();

        $msg = [
            'status'        => 200,
            'message'       => 'Semua data users',
            'data'          => ['users' => $query],
        ];
        return $this->respond($msg, $msg['status']);
    }

    public function show($id = null)
    {
        $user = $this->usersModel->find($id);
        if ($user) {
            $msg = [
                'status'        => 200,
                'message'       => 'Semua data users',
                'data'          => ['users' => $user],
            ];
        } else {
            $msg = [
                'status'        => 404,
                'message'       => 'Data user tidak ditemukan',
                'data'          => [],
            ];
        }
        return $this->respond($msg, $msg['status']);
    }

    public function create()
    {
        $validasi = $this->validate([
            'name' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Name harus di isi'
                ]
            ],
            'username' => [
                'rules' => 'required|is_unique[users.username]',
                'errors' => [
                    'required' => 'Username harus di isi'
                ]
            ],
            'email' => [
                'rules' => 'required|valid_email|is_unique[auth_identities.secret]',
                'errors' => [
                    'required' => 'Email harus di isi',
                    'valid_email' => 'Email tidak valid'
                ]
            ],
            'password' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Password harus di isi',
                ]
            ],
        ]);

        if (!$validasi) {
            $msg = [
                'status'        => 500,
                'message'       => 'Validation error',
                'data' => [
                    'name' => $this->validation->getError('name'),
                    'username' => $this->validation->getError('username'),
                    'email' => $this->validation->getError('email'),
                    'password' => $this->validation->getError('password'),
                ]
            ];
        } else {
            $allowedPostFields = array_merge(
                setting('Auth.validFields'),
                setting('Auth.personalFields'),
                ['password']
            );

            $data = (array)$this->request->getVar($allowedPostFields);
            $data['user_created'] = auth()->id();

            $this->usersEntity->fill($data);

            try {
                $this->usersModel->save($this->usersEntity);
            } catch (\Throwable $e) {
                $msg = [
                    'status'        => 500,
                    'message'       => 'Data gagal di buat',
                    'data'          => [],
                ];
            }

            // To get the complete user object with ID, we need to get from the database
            $user = $this->usersModel->findById($this->usersModel->getInsertID());

            // Add to default group
            $this->usersModel->addToDefaultGroup($user);
            
            /** @var Session $authenticator */
            $authenticator = auth('session')->getAuthenticator();

            // Set the user active
            $authenticator->activateUser($user);

            $msg = [
                'status'        => 200,
                'message'       => 'Data berhasil di buat',
                'data'          => [],
            ];
        }
        return $this->respond($msg, $msg['status']);
    }

    public function edit($id = null)
    {
        $user = $this->usersModel->find($id);
        if ($user) {
            $msg = [
                'status'        => 200,
                'message'       => 'Semua data users',
                'data'          => ['users' => $user],
            ];
        } else {
            $msg = [
                'status'        => 404,
                'message'       => 'Data user tidak ditemukan',
                'data'          => [],
            ];
        }
        return $this->respond($msg, $msg['status']);
    }

    public function update($id = null)
    {
        $user = $this->usersModel->findById($id);

        if ($user->username == $this->request->getVar('username')) {
            $rulesUsername = 'required';
        }else {
            $rulesUsername = 'required|is_unique[users.username]';
        }

        if ($user->email == $this->request->getVar('email')) {
            $rulesEmail = 'required|valid_email';
        }else {
            $rulesEmail = 'required|valid_email|is_unique[auth_identities.secret]';
        }

        $validasi = $this->validate([
            'name' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Name harus di isi'
                ]
            ],
            'username' => [
                'rules' => $rulesUsername,
                'errors' => [
                    'required' => 'Username harus di isi',
                    'is_unique' => 'Username telah digunakan'
                ]
            ],
            'email' => [
                'rules' => $rulesEmail,
                'errors' => [
                    'required' => 'Email harus di isi',
                    'valid_email' => 'Email tidak valid',
                    'is_unique' => 'Email telah digunakan'
                ]
            ],
            'password' => [
                'rules' => 'permit_empty',
                'errors' => [
                    'permit_empty' => 'Password tidak harus di isi',
                ]
            ],
        ]);

        if (!$validasi) {
            $msg = [
                'status'        => 500,
                'message'       => 'Validation error',
                'data' => [
                    'name' => $this->validation->getError('name'),
                    'username' => $this->validation->getError('username'),
                    'email' => $this->validation->getError('email'),
                    'password' => $this->validation->getError('password'),
                ]
            ];
        } else {
            $allowedPostFields = array_merge(
                setting('Auth.validFields'),
                setting('Auth.personalFields'),
                ['password']
            );

            $data = (array)$this->request->getVar($allowedPostFields);
            $data['user_updated'] = auth()->id();

            $user->fill($data);

            try {
                $this->usersModel->save($user);
            } catch (\Throwable $e) {
                $msg = [
                    'status'        => 500,
                    'message'       => 'Data gagal di update',
                    'data'          => [],
                ];
            }

            $msg = [
                'status'        => 200,
                'message'       => 'Data berhasil di update',
                'data'          => [],
            ];
        }
        return $this->respond($msg, $msg['status']);
    }

    public function addGroup()
    {
        $id = $this->request->getVar('id');
        $groups = (array)$this->request->getVar('group');

        $user = $this->usersModel->find($id);
        $user_groups = $user->getGroups();

        $check_group = array_diff($groups, $user_groups);

        if (count($check_group) > 0) {
            foreach ($check_group as $group) {
                $user->addGroup($group);
            }
        }
        
        $msg = [
            'status'        => 200,
            'message'       => 'User berhasil di tambahkan ke group',
            'data'          => [],
        ];
        return $this->respond($msg, $msg['status']);
    }

    public function removeGroup()
    {
        $id = $this->request->getVar('id');
        $groups = (array)$this->request->getVar('group');

        $user = $this->usersModel->find($id);
        $user_groups = $user->getGroups();

        $check_group = array_intersect($groups, $user_groups);

        if (count($check_group) > 0) {
            foreach ($check_group as $cg) {
                $user->removeGroup($cg);
            }
        }

        $msg = [
            'status'        => 200,
            'message'       => 'User berhasil di hapus dari group',
            'data'          => [$check_group],
        ];
        return $this->respond($msg, $msg['status']);
    }

    public function addPermission()
    {
        $id = $this->request->getVar('id');
        $permissions = (array) $this->request->getVar('permission');

        $user = $this->usersModel->find($id);
        $user_permission = $user->getPermissions();

        $check_permission = array_diff($permissions, $user_permission);

        if (count($check_permission) > 0) {
            foreach ($check_permission as $cp) {
                $user->addPermission($cp);
            }
        }

        $msg = [
            'status'        => 200,
            'message'       => 'Permission berhasil diberikan kepada user',
            'data'          => [],
        ];
        return $this->respond($msg, $msg['status']);
    }

    public function removePermission($id = null)
    {
        $id = $this->request->getVar('id');
        $permissions = (array) $this->request->getVar('permission');

        $user = $this->usersModel->find($id);
        $user_permission = $user->getPermissions();

        $check_permission = array_intersect($user_permission, $permissions);

        if (count($check_permission) > 0) {
            foreach ($check_permission as $cp) {
                $user->removePermission($cp);
            }
        }

        $msg = [
            'status'        => 200,
            'message'       => 'User berhasil di hapus dari group',
            'data'          => [],
        ];
        return $this->respond($msg, $msg['status']);
    }
    
    public function getUsersGroup($id = null)
    {
        $user = $this->usersModel->find($id);
        $msg = [
            'status'        => 200,
            'message'       => 'Daftar group users',
            'data'          => ['groups' => $user->getGroups()],
        ];
        return $this->respond($msg, $msg['status']);
        
    }
    
    public function getUsersPermission($id = null)
    {
        $user = $this->usersModel->find($id);
        $msg = [
            'status'        => 200,
            'message'       => 'Daftar permission users',
            'data'          => ['groups' => $user->getPermissions()],
        ];
        return $this->respond($msg, $msg['status']);
        
    }

    public function delete($id = null)
    {
        $this->usersModel->delete($id, true);

        if ($this->model->affectedRows()) {
            $msg = [
                'status'        => 200,
                'message'       => 'Data berhasil di hapus',
                'data'          => [],
            ];
        } else {
            $msg = [
                'status'        => 500,
                'message'       => 'Data gagal dihapus',
                'data'          => [],
            ];
        }
        return $this->respond($msg, $msg['status']);
    }
}
