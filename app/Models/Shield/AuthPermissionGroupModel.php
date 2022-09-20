<?php

namespace App\Models\Shield;

use CodeIgniter\Model;

class AuthPermissionGroupModel extends Model
{
    protected $table            = 'auth_permission_groups';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $useSoftDeletes   = false;
    protected $allowedFields    = [];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $deletedField  = 'deleted_at';

    public function __construct() {
        parent::__construct();
        helper('general');
        $this->allowedFields = allfields($this->table);
    }
}
