      <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light">
        <div class="container">
          <a class="navbar-brand" href="<?= base_url()?>">Shop</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="<?= base_url()?>">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdown-1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Manage
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdown-1">
                  <a class="dropdown-item" href="<?= base_url('category') ?>">Kategori</a>
                  <a class="dropdown-item" href="<?= base_url('product') ?>">Produk</a>
                  <a class="dropdown-item" href="<?= base_url('order') ?>">Order</a>
                  <a class="dropdown-item" href="<?= base_url('user') ?>">Pengguna</a>
                </div>
              </li>
            </ul>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="<?=base_url('cart')?>"><i class="fas fa-shopping-cart"></i>Cart <?= getCart(); ?></a>
              </li>
              <?php if(!$this->session->userdata('is_login')): ?>
              <li class="nav-item">
                <a class="nav-link" href="<?= base_url('/login')?>">Login</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="<?= base_url('/register')?>">Register</a>
              </li>
              <?php else: ?>

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdown-2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <?= $this->session->userdata('name') ?>
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdown-2">
                  <a class="dropdown-item" href="<?= base_url('profile') ?>">Profile</a>
                  <a class="dropdown-item" href="<?= base_url('myorder')?>">Order</a>
                  <a class="dropdown-item" href="<?= base_url('/logout')?>">Logout</a>
                </div>
              </li>

              <?php endif ?>
            </ul>
          </div>
        </div>
      </nav>