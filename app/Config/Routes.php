<?php

namespace Config;


// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (is_file(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('HomeController');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'HomeController::index');
$routes->get('tes', 'Shield\AuthController::index');

$routes->group('api/v1', function ($routes) {

    $routes->post('login', 'Shield\AuthController::login');
    $routes->get('logout', 'Shield\AuthController::logout', ['filter' => 'checkauth']);
    $routes->get('logged-out', 'Shield\AuthController::loggedOut');

    $routes->get('getusersgroup/(:any)', 'Shield\UsersController::getUsersGroup/$1', ['filter' => 'checkauth']);
    $routes->post('addgroup', 'Shield\UsersController::addGroup', ['filter' => 'checkauth']);
    $routes->post('removegroup', 'Shield\UsersController::removeGroup', ['filter' => 'checkauth']);

    $routes->get('getuserspermission/(:any)', 'Shield\UsersController::getUsersPermission/$1', ['filter' => 'checkauth']);
    $routes->post('addpermission', 'Shield\UsersController::addPermission', ['filter' => 'checkauth']);
    $routes->post('removepermission', 'Shield\UsersController::removePermission', ['filter' => 'checkauth']);

    $routes->resource('users', ['controller' => 'Shield\UsersController', 'filter' => 'checkauth']);
    $routes->resource('usersgroups', ['controller' => 'Shield\AuthGroupController', 'filter' => 'checkauth']);
    $routes->resource('authpermission', ['controller' => 'Shield\AuthPermissionController', 'filter' => 'checkauth']);
    $routes->resource('authpermissiongroup', ['controller' => 'Shield\AuthPermissionGroupController', 'filter' => 'checkauth']);
    $routes->resource('productgroup', ['controller' => 'ProductGroupController', 'filter' => 'checkauth']);
    $routes->resource('productbrand', ['controller' => 'ProductBrandController', 'filter' => 'checkauth']);
    $routes->resource('supplier', ['controller' => 'SupplierController', 'filter' => 'checkauth']);
    $routes->resource('suppliergroup', ['controller' => 'SupplierGroupController', 'filter' => 'checkauth']);

    $routes->resource('purchasedetail', ['controller' => 'PurchaseDetailController']);
    $routes->resource('purchase', ['controller' => 'PurchaseController']);
    $routes->resource('product', ['controller' => 'ProductController']);
    $routes->resource('unit', ['controller' => 'UnitController']);
    $routes->resource('productgroup', ['controller' => 'ProductGroupController']);
    $routes->resource('productbrand', ['controller' => 'ProductBrandController']);
    $routes->resource('supplier', ['controller' => 'SupplierController']);
    $routes->resource('suppliergroup', ['controller' => 'SupplierGroupController']);

});

service('auth')->routes($routes);
/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
