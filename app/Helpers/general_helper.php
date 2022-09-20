<?php

/**
 * Untuk mendapatkan semua nama kolom dalam tabel database
 * @param string $table 
 * 
 * @return array
 */
function allfields($table)
{
    $db      = db_connect();
    $query = $db->query("SHOW COLUMNS FROM " . $table . ";")->getResultArray();
    $fields = [];
    foreach ($query as $q) {
        array_push($fields, $q['Field']);
    }
    return $fields;
}

function encrypt_url($p)
{
    $encrypter = \Config\Services::encrypter();
    return bin2hex($encrypter->encrypt($p));
}

function decrypt_url($p)
{
    $encrypter = \Config\Services::encrypter();
    return $encrypter->decrypt(hex2bin($p));
}

function convertTanggal($tanggal, $cetak_hari = false)
{
    $hari = array(
        1 =>    'Senin',
        'Selasa',
        'Rabu',
        'Kamis',
        'Jumat',
        'Sabtu',
        'Minggu'
    );

    $bulan = array(
        1 =>   'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
    );
    $split       = explode('-', $tanggal);
    $tgl_indo = $split[2] . ' ' . $bulan[(int)$split[1]] . ' ' . $split[0];

    if ($cetak_hari) {
        $num = date('N', strtotime($tanggal));
        return $hari[$num] . ', ' . $tgl_indo;
    }
    return $tgl_indo;
}

function convertBulan($bulan)
{
    switch ($bulan) {
        case '1':
            return 'January';
            break;
        case '2':
            return 'February';
            break;
        case '3':
            return 'Maret';
            break;
        case '4':
            return 'April';
            break;
        case '5':
            return 'Mei';
            break;
        case '6':
            return 'Juni';
            break;
        case '7':
            return 'Juli';
            break;
        case '8':
            return 'Agustus';
            break;
        case '9':
            return 'September';
            break;
        case '10':
            return 'Oktober';
            break;
        case '11':
            return 'November';
            break;
        default:
            return 'Desember';
            break;
    }
}

function get_kode($table, $primaryKey, $prefix, $prefix_date = false)
{
    $db = db_connect();

    $query = $db->query("SELECT MAX($primaryKey) as max_kode FROM $table")->getFirstRow('array');

    if ($prefix_date == false) {
        if ($query <> 0) {
            $urutan_kode = (int) substr($query['max_kode'], -11) + 1;
        } else {
            $urutan_kode = 1;
        }

        $kode = $prefix . '-' . sprintf('%011s', $urutan_kode);
    } else {
        if ($query <> 0) {
            $urutan_kode = (int) substr($query['max_kode'], -11) + 1;
        } else {
            $urutan_kode = 1;
        }

        $kode = $prefix . '-' . date('Y') . '-' . date('m') . '-' . sprintf('%011s', $urutan_kode);
    }
    return $kode;
}

function getToken()
{
    $request = service('request');
    $getToken = $request->getHeaderLine('Authorization');
    $token = substr($getToken, 7);

    return $token;
}

function getAuthGroup()
{
    $db = db_connect();
    $query = $db->table('auth_groups')->get()->getResultArray();

    $group = array();
    foreach ($query as $q) {
        $group[$q['group_name']] = [
            'title' => $q['title'],
            'description' => $q['description']
        ];
    }

    return $group;
}

function getPermission()
{
    $db = db_connect();
    $query = $db->table('auth_permission')->get()->getResultArray();

    $permission = array();
    foreach ($query as $q) {
        $permission[$q['authorization']] = $q['description'];
    }

    return $permission;
}

function getPermissionGroup()
{
    $db = db_connect();
    $query = $db->table('auth_permission_groups')->select('group_name, authorization')
        ->join('auth_groups', 'auth_groups.id=auth_permission_groups.group_id')
        ->join('auth_permission', 'auth_permission.id=auth_permission_groups.permission')
        ->get()->getResultArray();

    $permission_group = array();
    foreach ($query as $q) {
        $permission_group[$q['group_name']][] = $q['authorization'];
    }

    return $permission_group;
}
