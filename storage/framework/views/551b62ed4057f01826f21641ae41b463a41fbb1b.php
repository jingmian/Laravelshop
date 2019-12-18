<?php $__env->startSection('title', '商品评价'); ?>

<?php $__env->startSection('content'); ?>
  <div class="row">
    <div class="col-lg-10 offset-lg-1">
      <div class="card">
        <div class="card-header">
          商品评价
          <a class="float-right" href="<?php echo e(route('orders.index'), false); ?>">返回订单列表</a>
        </div>
        <div class="card-body">
          <form action="<?php echo e(route('orders.review.store', [$order->id]), false); ?>" method="post">
            <input type="hidden" name="_token" value="<?php echo e(csrf_token(), false); ?>">
            <table class="table">
              <tbody>
              <tr>
                <td>商品名称</td>
                <td>打分</td>
                <td>评价</td>
              </tr>
              <?php $__currentLoopData = $order->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr>
                  <td class="product-info">
                    <div class="preview">
                      <a target="_blank" href="<?php echo e(route('products.show', [$item->product_id]), false); ?>">
                        <img src="<?php echo e($item->product->image_url, false); ?>">
                      </a>
                    </div>
                    <div>
                <span class="product-title">
                   <a target="_blank" href="<?php echo e(route('products.show', [$item->product_id]), false); ?>"><?php echo e($item->product->title, false); ?></a>
                </span>
                      <span class="sku-title"><?php echo e($item->productSku->title, false); ?></span>
                    </div>
                    <input type="hidden" name="reviews[<?php echo e($index, false); ?>][id]" value="<?php echo e($item->id, false); ?>">
                  </td>
                  <td class="vertical-middle">
                    <!-- 如果订单已经评价则展示评分，下同 -->
                    <?php if($order->reviewed): ?>
                      <span class="rating-star-yes"><?php echo e(str_repeat('★', $item->rating), false); ?></span><span class="rating-star-no"><?php echo e(str_repeat('★', 5 - $item->rating), false); ?></span>
                    <?php else: ?>
                      <ul class="rate-area">
                        <input type="radio" id="5-star-<?php echo e($index, false); ?>" name="reviews[<?php echo e($index, false); ?>][rating]" value="5" checked /><label for="5-star-<?php echo e($index, false); ?>"></label>
                        <input type="radio" id="4-star-<?php echo e($index, false); ?>" name="reviews[<?php echo e($index, false); ?>][rating]" value="4" /><label for="4-star-<?php echo e($index, false); ?>"></label>
                        <input type="radio" id="3-star-<?php echo e($index, false); ?>" name="reviews[<?php echo e($index, false); ?>][rating]" value="3" /><label for="3-star-<?php echo e($index, false); ?>"></label>
                        <input type="radio" id="2-star-<?php echo e($index, false); ?>" name="reviews[<?php echo e($index, false); ?>][rating]" value="2" /><label for="2-star-<?php echo e($index, false); ?>"></label>
                        <input type="radio" id="1-star-<?php echo e($index, false); ?>" name="reviews[<?php echo e($index, false); ?>][rating]" value="1" /><label for="1-star-<?php echo e($index, false); ?>"></label>
                      </ul>
                    <?php endif; ?>
                  </td>
                  <td>
                    <?php if($order->reviewed): ?>
                      <?php echo e($item->review, false); ?>

                    <?php else: ?>
                      <textarea class="form-control <?php echo e($errors->has('reviews.'.$index.'.review') ? 'is-invalid' : '', false); ?>" name="reviews[<?php echo e($index, false); ?>][review]"></textarea>
                      <?php if($errors->has('reviews.'.$index.'.review')): ?>
                        <?php $__currentLoopData = $errors->get('reviews.'.$index.'.review'); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $msg): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <span class="invalid-feedback" role="alert"><strong><?php echo e($msg, false); ?></strong></span>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      <?php endif; ?>
                    <?php endif; ?>
                  </td>
                </tr>
              <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
              </tbody>
              <tfoot>
              <tr>
                <td colspan="3" class="text-center">
                  <?php if(!$order->reviewed): ?>
                    <button type="submit" class="btn btn-primary center-block">提交</button>
                  <?php else: ?>
                    <a href="<?php echo e(route('orders.show', [$order->id]), false); ?>" class="btn btn-primary">查看订单</a>
                  <?php endif; ?>
                </td>
              </tr>
              </tfoot>
            </table>
          </form>
        </div>
      </div>
    </div>
  </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/laravel-shop-1/resources/views/orders/review.blade.php ENDPATH**/ ?>