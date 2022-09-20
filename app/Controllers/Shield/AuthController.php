<?php

namespace App\Controllers\Shield;

use App\Controllers\BaseApiController;
use CodeIgniter\Shield\Models\UserModel;

class AuthController extends BaseApiController
{
    protected $userModel;
    protected $validation;


    public function __construct()
    {
        $this->validation = \Config\Services::validation();
        $this->userModel = new UserModel();
    }

    public function login()
    {
        if (auth()->loggedIn()) {
            auth()->logout();
        }

        $validasi = $this->validate([
            'email_username' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Email atau username Harus di isi',
                ],
            ],
            'password' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Password Harus di isi'
                ],
            ],
        ]);

        if (!$validasi) {
            $msg = [
                'status' => 500,
                'message' => 'Validasi error',
                'data' => [
                    'email_username' => $this->validation->getError('email_username'),
                    'password' => $this->validation->getError('password'),
                ],
            ];
        } else {
            if (filter_var($this->request->getVar('email_username'), FILTER_VALIDATE_EMAIL)) {
                $credentials = [
                    'email'    => $this->request->getVar('email_username'),
                    'password' => $this->request->getVar('password')
                ];
            }else {
                $credentials = [
                    'username'    => $this->request->getVar('email_username'),
                    'password' => $this->request->getVar('password')
                ];
            }

            $loginAttempt = auth()->attempt($credentials);

            if (!$loginAttempt->isOK()) {
                $msg = [
                    'status' => 401,
                    'message' => 'Credensial invalid',
                    'data' => [
                        'error' => $loginAttempt->reason(),
                    ],
                ];
            } else {
                $user = auth()->user();
                $token = $user->generateAccessToken('token');
                $msg = [
                    'status' => 200,
                    'message' => 'Credensial valid',
                    'data' => [
                        'token' => $token->raw_token,
                    ],
                ];
            }
        }
        return $this->respond($msg, $msg['status']);
    }

    public function logout()
    {
        $user = auth('tokens')->user();
        $getToken = $this->request->getHeaderLine('Authorization');
        $token = substr($getToken, 7);
        $user->revokeAccessToken($token);
        auth('tokens')->logout();
        $msg = [
            'status' => 200,
            'message' => 'Anda telah logout',
            'data' => [],
        ];
        return $this->respond($msg, $msg['status']);
    }

    public function loggedOut()
    {
        $msg = [
            'status' => 401,
            'message' => 'Invalid Authentication, Please login!'
        ];
        return $this->respond($msg, $msg['status']);
    }
}
