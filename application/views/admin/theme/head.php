    <!DOCTYPE html>
    <html lang="en">
    <head>
        <title>{title}</title>
    		{css}
        <link rel="stylesheet" href="{url}">
    		{/css}
    </head>

    <body class="skin-default-dark fixed-layout">
        <div class="preloader">
            <div class="loader">
                <div class="loader__figure"></div>
                <p class="loader__label">Sistem Informasi Penduduk</p>
            </div>
        </div>
        <style media="screen">
          /* .modal-dialog{
            overflow-y:scroll;
          } */
          .modal-dialog{
            max-width: 100%;
            width:80%;
          }
        </style>
        <?php
        $base = function($page=''){
          return base_url("public/").$page;
        }
        ?>
        <div id="main-wrapper">
            <header class="topbar">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <div class="navbar-collapse">
                    </div>
                </nav>
            </header>
            <aside class="left-sidebar">
                <div class="d-flex no-block nav-text-box align-items-center">
                    <a class="waves-effect waves-dark ml-auto hidden-sm-down" href="javascript:void(0)"><i class="ti-menu"></i></a>
                    <a class="nav-toggler waves-effect waves-dark ml-auto hidden-sm-up" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                </div>
                <div class="scroll-sidebar">
                    <nav class="sidebar-nav">
                        <ul id="sidebarnav">
                          <li> <a class="waves-effect waves-dark" href="<?= $base() ?>" aria-expanded="false"><i class="fa fa-tachometer"></i><span class="hide-menu">Dashboard</span></a></li>
                          <li> <a class="waves-effect waves-dark" href="<?= $base("pelanggaran") ?>" aria-expanded="false"><i class="fa fa-edit"></i><span class="hide-menu">Pelanggaran</span></a></li>
                        </ul>
                    </nav>
                </div>
            </aside>
