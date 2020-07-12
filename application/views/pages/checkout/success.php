 <main class="container mt-5" role="main">
  <?php $this->load->view('layouts/_alert') ?>
  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          Checkout Berhasil
        </div>
        <div class="card-body">
          <h5>Nomer Order:<?= $content->invoice ?></h5>
          <p>Terima Kasih, Sudah berbelanja</p>
          <p>Silahkan lakukan pembayaran untuk bisa kami proses selanjutnya dengan cara:</p>
          <ol>
            <li>Lakukan pembayaran pada rekening <strong>BCA 203929921201921</strong> a/n PT.Butik</li>
            <li>Sertakan keterangan dengan nomor order: <strong><?= $content->invoice ?></strong></li>
            <li>Total Pembayaran : <strong>Rp<?= number_format($content->total,0,',','.') ?>,-</strong></li>
          </ol>
          <p>Jika sudah, silahkan kirim bukti transfer di halaman konfirmasi atau bisa klik disini! <a href="<?= base_url("myorder/detail/$content->invoice")?>">Klik disini</a></p>
          <a href="<?= base_url('/')?>" class="btn btn-primary"><i class="fas fa-angle-left"></i>Kembali</a>
        </div>
      </div>
    </div>
  </div>
</main>