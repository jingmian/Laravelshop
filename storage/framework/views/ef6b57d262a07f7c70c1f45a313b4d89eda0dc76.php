<?php $__env->startSection('title', '查看订单'); ?>

<?php $__env->startSection('content'); ?>
  <div class="row">
    <div class="col-lg-10 offset-lg-1">
      <div class="card">
        <div class="card-header">
          <h4>订单详情</h4>
        </div>
        <div class="card-body">
          <table class="table">
            <thead>
            <tr>
              <th>商品信息</th>
              <th class="text-center">单价</th>
              <th class="text-center">数量</th>
              <th class="text-right item-amount">小计</th>
            </tr>
            </thead>
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
                </td>
                <td class="sku-price text-center vertical-middle">￥<?php echo e($item->price, false); ?></td>
                <td class="sku-amount text-center vertical-middle"><?php echo e($item->amount, false); ?></td>
                <td class="item-amount text-right vertical-middle">￥<?php echo e(number_format($item->price * $item->amount, 2, '.', ''), false); ?></td>
              </tr>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <tr><td colspan="4"></td></tr>
          </table>
          <div class="order-bottom">
            <div class="order-info">
              <div class="line"><div class="line-label">收货地址：</div><div class="line-value"><?php echo e(join(' ', $order->address), false); ?></div></div>
              <div class="line"><div class="line-label">订单备注：</div><div class="line-value"><?php echo e($order->remark ?: '-', false); ?></div></div>
              <div class="line"><div class="line-label">订单编号：</div><div class="line-value"><?php echo e($order->no, false); ?></div></div>
              <!-- 输出物流状态 -->
              <div class="line">
                <div class="line-label">物流状态：</div>
                <div class="line-value"><?php echo e(\App\Models\Order::$shipStatusMap[$order->ship_status], false); ?></div>
              </div>
              <!-- 如果有物流信息则展示 -->
              <?php if($order->ship_data): ?>
                <div class="line">
                  <div class="line-label">物流信息：</div>
                  <div class="line-value"><?php echo e($order->ship_data['express_company'], false); ?> <?php echo e($order->ship_data['express_no'], false); ?></div>
                </div>
              <?php endif; ?>
              <!-- 订单已支付，且退款状态不是未退款时展示退款信息 -->
              <?php if($order->paid_at && $order->refund_status !== \App\Models\Order::REFUND_STATUS_PENDING): ?>
                <div class="line">
                  <div class="line-label">退款状态：</div>
                  <div class="line-value"><?php echo e(\App\Models\Order::$refundStatusMap[$order->refund_status], false); ?></div>
                </div>
                <div class="line">
                  <div class="line-label">退款理由：</div>
                  <div class="line-value"><?php echo e($order->extra['refund_reason'], false); ?></div>
                </div>
              <?php endif; ?>
            </div>
            <div class="order-summary text-right">
              <!-- 展示优惠信息开始 -->
              <?php if($order->couponCode): ?>
                <div class="text-primary">
                  <span>优惠信息：</span>
                  <div class="value"><?php echo e($order->couponCode->description, false); ?></div>
                </div>
              <?php endif; ?>
              <!-- 展示优惠信息结束 -->
              <div class="total-amount">
                <span>订单总价：</span>
                <div class="value">￥<?php echo e($order->total_amount, false); ?></div>
              </div>
              <div>
                <span>订单状态：</span>
                <div class="value">
                  <?php if($order->paid_at): ?>
                    <?php if($order->refund_status === \App\Models\Order::REFUND_STATUS_PENDING): ?>
                      已支付
                    <?php else: ?>
                      <?php echo e(\App\Models\Order::$refundStatusMap[$order->refund_status], false); ?>

                    <?php endif; ?>
                  <?php elseif($order->closed): ?>
                    已关闭
                  <?php else: ?>
                    未支付
                  <?php endif; ?>
                </div>
              </div>
              <?php if(isset($order->extra['refund_disagree_reason'])): ?>
                <div>
                  <span>拒绝退款理由：</span>
                  <div class="value"><?php echo e($order->extra['refund_disagree_reason'], false); ?></div>
                </div>
              <?php endif; ?>
              <!-- 支付按钮开始 -->
              <?php if(!$order->paid_at && !$order->closed): ?>
                <div class="payment-buttons">
                  <a class="btn btn-primary btn-sm" href="<?php echo e(route('payment.alipay', ['order' => $order->id]), false); ?>">支付宝支付</a>
                  <button class="btn btn-sm btn-success" id='btn-wechat'>微信支付</button>
                </div>
              <?php endif; ?>
              <!-- 支付按钮结束 -->
              <!-- 如果订单的发货状态为已发货则展示确认收货按钮 -->
              <?php if($order->ship_status === \App\Models\Order::SHIP_STATUS_DELIVERED): ?>
                <div class="receive-button">
                  <!-- 将原本的表单替换成下面这个按钮 -->
                  <button type="button" id="btn-receive" class="btn btn-sm btn-success">确认收货</button>
                </div>
              <?php endif; ?>
              <!-- 订单已支付，且退款状态是未退款时展示申请退款按钮 -->
              <?php if($order->paid_at && $order->refund_status === \App\Models\Order::REFUND_STATUS_PENDING): ?>
                <div class="refund-button">
                  <button class="btn btn-sm btn-danger" id="btn-apply-refund">申请退款</button>
                </div>
              <?php endif; ?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scriptsAfterJs'); ?>
  <script>
    $(document).ready(function() {
      // 微信支付按钮事件
      $('#btn-wechat').click(function() {
        swal({
          // content 参数可以是一个 DOM 元素，这里我们用 jQuery 动态生成一个 img 标签，并通过 [0] 的方式获取到 DOM 元素
          content: $('<img src="<?php echo e(route('payment.wechat', ['order' => $order->id]), false); ?>" />')[0],
          // buttons 参数可以设置按钮显示的文案
          buttons: ['关闭', '已完成付款'],
        })
          .then(function(result) {
            // 如果用户点击了 已完成付款 按钮，则重新加载页面
            if (result) {
              location.reload();
            }
          })
      });

      // 确认收货按钮点击事件
      $('#btn-receive').click(function() {
        // 弹出确认框
        swal({
          title: "确认已经收到商品？",
          icon: "warning",
          dangerMode: true,
          buttons: ['取消', '确认收到'],
        })
          .then(function(ret) {
            // 如果点击取消按钮则不做任何操作
            if (!ret) {
              return;
            }
            // ajax 提交确认操作
            axios.post('<?php echo e(route('orders.received', [$order->id]), false); ?>')
              .then(function () {
                // 刷新页面
                location.reload();
              })
          });
      });

      // 退款按钮点击事件
      $('#btn-apply-refund').click(function () {
        swal({
          text: '请输入退款理由',
          content: "input",
        }).then(function (input) {
          // 当用户点击 swal 弹出框上的按钮时触发这个函数
          if(!input) {
            swal('退款理由不可空', '', 'error');
            return;
          }
          // 请求退款接口
          axios.post('<?php echo e(route('orders.apply_refund', [$order->id]), false); ?>', {reason: input})
            .then(function () {
              swal('申请退款成功', '', 'success').then(function () {
                // 用户点击弹框上按钮时重新加载页面
                location.reload();
              });
            });
        });
      });

    });
  </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/laravel-shop-1/resources/views/orders/show.blade.php ENDPATH**/ ?>