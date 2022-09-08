<?php

namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;

class HomeController extends ResourceController
{
    public function index()
    {
        return view('welcome_message');
    }

    public function getTes()
    {
        $data = [
            'status' => 200,
            'body' => [
                'tes' => 'dbhfhjskdb',
                'tes2' => 'dbhfhjskdb',
            ]
        ];

        return $this->respond($data, 200);
    }
}
