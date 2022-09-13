<?php

namespace App\Models;

use CodeIgniter\Model;

class UnitModel extends Model
{
    protected $table            = 'units';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = false;
    protected $insertID         = 0;
    protected $useSoftDeletes   = true;
    protected $allowedFields    = [];

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $deletedField  = 'deleted_at';

    public function __construct()
    {
        // $this->supplierModel = new SupplierModel();
        parent::__construct();
        helper('general');
        $this->allowedFields = allfields($this->table);
    }
}
