<?php

namespace App\Models\Shield;

use CodeIgniter\Model;

class AuthPermissionModel extends Model
{
    protected $table            = 'auth_permission';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $useSoftDeletes   = false;
    protected $allowedFields    = ['id', 'permission_name', 'authorization', 'description', 'created_at', 'updated_at', 'deleted_at'];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $deletedField  = 'deleted_at';


}
