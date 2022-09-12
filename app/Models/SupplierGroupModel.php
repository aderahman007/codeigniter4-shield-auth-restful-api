<?php

namespace App\Models;

use CodeIgniter\Model;

class SupplierGroupModel extends Model
{
    protected $table            = 'suppliergroup';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = false;
    protected $useSoftDeletes   = true;
    protected $allowedFields    = ['id', 'description', 'parent', 'isgroup', 'payableacc', 'downpaymentacc', 'rewardacc', 'purchasediscacc', 'gainlosspayableacc', 'usercreate', 'useredit', 'created_at', 'updated_at', 'deleted_at'];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $deletedField  = 'deleted_at';


}
