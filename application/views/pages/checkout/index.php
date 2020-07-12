 <main class="container" role="main">
  <?php $this->load->view('layouts/_alert'); ?>
  <div class="row">
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
          Formulir Alamat Pengiriman
        </div>
        <div class="card-body">
          <form action="<?= base_url("checkout/create")?>" method="POST">
            <div class="form-group">
              <label>Nama</label>
              <input type="text" class="form-control" name="name" placeholder="Masukan Nama Pencarian" value="<?= $input->name ?>">
              <?= form_error('name')?>
            </div>
            <div class="form-group">
              <label>Alamat</label>
              <textarea name="address" id="" cols="30" rows="5" class="form-control"><?= $input->address ?></textarea>
              <?= form_error('address') ?>
            </div>
            <div class="form-group">
              <label>Telepon</label>
              <input type="text" class="form-control" name="phone" value="<?= $input->phone ?>" placeholder="Masukan Nomor Telepon Penerima">
              <?= form_error('phone')?>
            </div>
            <button class="btn btn-primary" type="submit">Checkout</button>
          </form>
        </div>
      </div>
    </div>
    <div class="col-md-6">    
       <div class="row">
          <div class="col-md-12">
            <div class="card mb-3">
              <div class="card-header">
                Cart
              </div>
              <div class="card-body">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Produk</th>
                      <th>Qty</th>
                      <th>Harga</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach($cart as $row): ?>
                    <tr>
                      <th><?= $row->title ?></th>
                      <th><?= $row->qty ?></th>
                      <th>Rp<?= number_format($row->price,0,',','.')?>,-</th>
                    </tr>
                    <tr>
                      <td colspan="2">Subtotal</td>
                      <td>Rp<?= number_format($row->subtotal,0,',','.')?>,-</td>
                    </tr>
                    <?php endforeach ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2">Total</td>
                      <th>Rp<?= number_format(array_sum(array_column($cart, 'subtotal')),0,',','.')?>,-</th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          </div>
        </div>
    </div>
  </div>
</main>