 <main class="container mt-5" role="main">
  <?php $this->load->view('layouts/_alert') ?>
    <div class="row">
      <div class="col-md-10 mx-auto">
        <div class="card">
          
          <div class="card-header">
            <span>Kategori</span>
            <a href="<?= base_url('category/create') ?>" class="btn btn-sm btn-secondary">Tambah</a>

            <div class="float-right">
              <?= form_open(base_url('category/search'),['method'=>'POST'])?>
                <div class="input-group">
                  <input type="text" class="form-control form-control-sm text-center" name="keyword" placeholder="Cari" value="<?= $this->session->userdata('keyword') ?>">
                  <div class="input-group-append">
                    <button class="btn btn-secondary btn-sm btn-info" type="submit">
                      <i class="fas fa-search"></i> 
                    </button>
                    <a href="<?= base_url('category/reset')?>" class="btn btn-secondary btn-sm btn-info">
                      <i class="fas fa-eraser"></i>
                    </a>
                  </div>
                </div>
              <?= form_close()?>
            </div>
          </div>           

          <div class="card-body">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Title</th>
                  <th scope="col">Slug</th>
                  <th scope="col"></th>
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody>
                <?php $no=0; foreach ($content as $row ): $no++; ?>
                <tr>
                  <td><?= $no ?></td>
                  <td><?= $row->title ?></td>
                  <td><?= $row->slug ?></td>
                  <td>

                    <a href="<?= base_url("category/edit/$row->id")?>">
                      <button class="btn btn-sm"><i class="fas fa-edit text-info"></i></button>
                    </a>
                  </td>
                  <td>
                    <?= form_open("category/delete/$row->id",['method'=>'POST']) ?>
                    <?= form_hidden('id', $row->id) ?>
                        <button class="btn btn-sm" type="submit" onclick="return confirm('Apa yakin data Kategori ini akan dihapus?')"><i class="fas fa-trash text-danger"></i></button>
                    <?= form_close() ?>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
            </table>

            <nav aria-label="Page navigation example">
              <?= $pagination ?>
            </nav>
                            
          </div>
        </div>
      </div>
    </div>
  </main>