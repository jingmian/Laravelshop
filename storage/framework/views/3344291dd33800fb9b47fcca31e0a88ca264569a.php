<?php $__env->startSection('title', $product->title); ?>

<?php $__env->startSection('content'); ?>
  <div class="row">
    <div class="col-lg-10 offset-lg-1">
      <div class="card">
        <div class="card-body product-info">
          <div class="row">
            <div class="col-5">
              <img class="cover" src="<?php echo e($product->image_url, false); ?>" alt="">
            </div>
            <div class="col-7">
              <div class="title"><?php echo e($product->title, false); ?></div>
              <div class="price"><label>价格</label><em>￥</em><span><?php echo e($product->price, false); ?></span></div>
              <div class="sales_and_reviews">
                <div class="sold_count">累计销量 <span class="count"><?php echo e($product->sold_count, false); ?></span></div>
                <div class="review_count">累计评价 <span class="count"><?php echo e($product->review_count, false); ?></span></div>
                <div class="rating" title="评分 <?php echo e($product->rating, false); ?>">评分 <span class="count"><?php echo e(str_repeat('★', floor($product->rating)), false); ?><?php echo e(str_repeat('☆', 5 - floor($product->rating)), false); ?></span></div>
              </div>
              <div class="skus">
                <label>选择</label>
                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                  <?php $__currentLoopData = $product->skus; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $sku): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <label
                        class="btn sku-btn"
                        data-price="<?php echo e($sku->price, false); ?>"
                        data-stock="<?php echo e($sku->stock, false); ?>"
                        data-toggle="tooltip"
                        title="<?php echo e($sku->description, false); ?>"
                        data-placement="bottom">
                      <input type="radio" name="skus" autocomplete="off" value="<?php echo e($sku->id, false); ?>"> <?php echo e($sku->title, false); ?>

                    </label>
                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
              </div>
              <div class="cart_amount"><label>数量</label><input type="text" class="form-control form-control-sm" value="1"><span>件</span><span class="stock"></span></div>
              <div class="buttons">
                <?php if($favored): ?>
                  <button class="btn btn-danger btn-disfavor">取消收藏</button>
                <?php else: ?>
                  <button class="btn btn-success btn-favor">❤ 收藏</button>
                <?php endif; ?>
                <button class="btn btn-primary btn-add-to-cart">加入购物车</button>
              </div>
            </div>
          </div>
          <div class="product-detail">
            <ul class="nav nav-tabs" role="tablist">
              <li class="nav-item">
                <a class="nav-link active" href="#product-detail-tab" aria-controls="product-detail-tab" role="tab" data-toggle="tab" aria-selected="true">商品详情</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#product-reviews-tab" aria-controls="product-reviews-tab" role="tab" data-toggle="tab" aria-selected="false">用户评价</a>
              </li>
            </ul>
            <div class="tab-content">
              <div role="tabpanel" class="tab-pane active" id="product-detail-tab">
                <?php echo $product->description; ?>

              </div>
              <div role="tabpanel" class="tab-pane" id="product-reviews-tab">
                <!-- 评论列表开始 -->
                <table class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <td>用户</td>
                    <td>商品</td>
                    <td>评分</td>
                    <td>评价</td>
                    <td>时间</td>
                  </tr>
                  </thead>
                  <tbody>
                  <?php $__currentLoopData = $reviews; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $review): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <tr>
                      <td><?php echo e($review->order->user->name, false); ?></td>
                      <td><?php echo e($review->productSku->title, false); ?></td>
                      <td><?php echo e(str_repeat('★', $review->rating), false); ?><?php echo e(str_repeat('☆', 5 - $review->rating), false); ?></td>
                      <td><?php echo e($review->review, false); ?></td>
                      <td><?php echo e($review->reviewed_at->format('Y-m-d H:i'), false); ?></td>
                    </tr>
                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                  </tbody>
                </table>
                <!-- 评论列表结束 -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scriptsAfterJs'); ?>
  <script>
    $(document).ready(function () {
      $('[data-toggle="tooltip"]').tooltip({trigger: 'hover'});
      $('.sku-btn').click(function () {
        $('.product-info .price span').text($(this).data('price'));
        $('.product-info .stock').text('库存：' + $(this).data('stock') + '件');
      });

      // 监听收藏按钮的点击事件
      $('.btn-favor').click(function () {
        axios.post('<?php echo e(route('products.favor', ['product' => $product->id]), false); ?>')
          .then(function () {
            swal('操作成功', '', 'success')
              .then(function () {  // 这里加了一个 then() 方法
                location.reload();
              });
          }, function(error) {
            if (error.response && error.response.status === 401) {
              swal('请先登录', '', 'error');
            }  else if (error.response && error.response.data.msg) {
              swal(error.response.data.msg, '', 'error');
            }  else {
              swal('系统错误', '', 'error');
            }
          });
      });

      $('.btn-disfavor').click(function () {
        axios.delete('<?php echo e(route('products.disfavor', ['product' => $product->id]), false); ?>')
          .then(function () {
            swal('操作成功', '', 'success')
              .then(function () {
                location.reload();
              });
          });
      });

      // 加入购物车按钮点击事件
      $('.btn-add-to-cart').click(function () {

        // 请求加入购物车接口
        axios.post('<?php echo e(route('cart.add'), false); ?>', {
          sku_id: $('label.active input[name=skus]').val(),
          amount: $('.cart_amount input').val(),
        })
          .then(function () {
            swal('加入购物车成功', '', 'success')
              .then(function() {
                location.href = '<?php echo e(route('cart.index'), false); ?>';
              });
          }, function (error) { // 请求失败执行此回调
            if (error.response.status === 401) {

              // http 状态码为 401 代表用户未登陆
              swal('请先登录', '', 'error');

            } else if (error.response.status === 422) {

              // http 状态码为 422 代表用户输入校验失败
              var html = '<div>';
              _.each(error.response.data.errors, function (errors) {
                _.each(errors, function (error) {
                  html += error+'<br>';
                })
              });
              html += '</div>';
              swal({content: $(html)[0], icon: 'error'})
            } else {

              // 其他情况应该是系统挂了
              swal('系统错误', '', 'error');
            }
          })
      });

    });
  </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/laravel-shop-1/resources/views/products/show.blade.php ENDPATH**/ ?>