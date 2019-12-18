<?php

namespace Illuminate\Contracts\Auth;

interface MustVerifyEmail
{
    /**
     * 用于判断当前用户是否已经验证邮箱
     * Determine if the user has verified their email address.
     *
     * @return bool
     */
    public function hasVerifiedEmail();

    /**
     * 用于用户验证邮箱后填充数据表字段
     * Mark the given user's email as verified.
     *
     * @return bool
     */
    public function markEmailAsVerified();

    /**
     * 用于在新用户注册或者重发验证码时给对应用户发送邮箱验证邮件
     * Send the email verification notification.
     *
     * @return void
     */
    public function sendEmailVerificationNotification();
}
