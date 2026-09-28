<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
    <#elseif section = "form">
        <div class="workmate-shell">
            <aside class="workmate-brand-panel" aria-label="WorkMate 品牌展示">
                <div class="workmate-brand">
                    <div class="workmate-brand-logo" aria-hidden="true">
                        <svg width="48" height="48" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <rect width="48" height="48" rx="12" fill="white" fill-opacity="0.92"/>
                            <path d="M16.5 24.5C16.5 24.5 20 21 24 21C26.5 21 28.5 22.5 28.5 24.5C28.5 26 27 27.5 24 27.5C21 27.5 16.5 30 16.5 30" stroke="#10A37F" stroke-width="2.8" stroke-linecap="round"/>
                            <path d="M32 18L34.5 15.5" stroke="#10A37F" stroke-width="2.8" stroke-linecap="round"/>
                            <path d="M35.5 21L38 21" stroke="#10A37F" stroke-width="2.8" stroke-linecap="round"/>
                        </svg>
                    </div>
                    <div class="workmate-brand-text">
                        <span class="workmate-brand-name">WorkMate 岗伴</span>
                        <span class="workmate-brand-version">v0.5.0</span>
                    </div>
                </div>

                <div class="workmate-hero">
                    <div class="workmate-hero-icon" aria-hidden="true">
                        <svg width="120" height="120" viewBox="0 0 120 120" fill="none" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet">
                            <defs>
                                <linearGradient id="glowGrad" x1="0" y1="0" x2="120" y2="120" gradientUnits="userSpaceOnUse">
                                    <stop stop-color="#D1FAE5" stop-opacity="0.8"/>
                                    <stop offset="1" stop-color="#DBEAFE" stop-opacity="0.6"/>
                                </linearGradient>
                            </defs>
                            <rect x="8" y="8" width="104" height="104" rx="32" fill="url(#glowGrad)"/>
                            <rect x="16" y="16" width="88" height="88" rx="26" fill="white" fill-opacity="0.95"/>
                            <path d="M42 61C42 61 50 52 60 52C66 52 71 55.5 71 61C71 64.5 67.5 68 60 68C52.5 68 42 74 42 74" stroke="#10A37F" stroke-width="6" stroke-linecap="round"/>
                            <path d="M80 44L86 38" stroke="#10A37F" stroke-width="6" stroke-linecap="round"/>
                            <path d="M88.5 51.5L95 51.5" stroke="#10A37F" stroke-width="6" stroke-linecap="round"/>
                        </svg>
                    </div>
                </div>

                <div class="workmate-hero-copy" aria-hidden="true">
                    <h2 class="workmate-hero-copy-title">一句话，让工作真正完成</h2>
                    <p class="workmate-hero-copy-subtitle-en">Say What You Need. Workmate Gets It Done.</p>
                    <p class="workmate-hero-copy-text">
                        像同事一样自主规划、执行任务，交付可验收成果
                    </p>
                </div>
            </aside>
            <section class="workmate-auth-panel" aria-labelledby="update-password-title">
                <div class="workmate-auth-card">
                    <div class="workmate-auth-inner">
                        <h1 id="update-password-title" class="workmate-title">设置新密码</h1>
                        <p class="workmate-subtitle">为了账号安全，请设置新的登录密码</p>

                        <#if messagesPerField.existsError('password','password-new','password-confirm')>
                        <div class="workmate-error" aria-live="polite">
                            <svg class="workmate-error-icon" width="20" height="20" viewBox="0 0 20 20" fill="none" aria-hidden="true">
                                <circle cx="10" cy="10" r="10" fill="#FEF2F2"/>
                                <path d="M10 5V11" stroke="#DC2626" stroke-width="2" stroke-linecap="round"/>
                                <circle cx="10" cy="14.5" r="1.2" fill="#DC2626"/>
                            </svg>
                            <span>${kcSanitize(messagesPerField.getFirstError('password','password-new','password-confirm'))?no_esc}</span>
                        </div>
                        </#if>

                        <form id="kc-passwd-update-form" class="workmate-form" action="${url.loginAction}" method="post">
                            <div class="workmate-field">
                                <label class="workmate-field-label" for="password">当前密码</label>
                                <input
                                    tabindex="1"
                                    id="password"
                                    name="password"
                                    type="password"
                                    autofocus
                                    autocomplete="current-password"
                                    placeholder="请输入当前密码"
                                    aria-label="当前密码"
                                    aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"
                                />
                            </div>

                            <div class="workmate-field">
                                <label class="workmate-field-label" for="password-new">新密码</label>
                                <input
                                    tabindex="2"
                                    id="password-new"
                                    name="password-new"
                                    type="password"
                                    autocomplete="new-password"
                                    placeholder="请输入新密码"
                                    aria-label="新密码"
                                    aria-invalid="<#if messagesPerField.existsError('password-new')>true</#if>"
                                />
                            </div>

                            <div class="workmate-field">
                                <label class="workmate-field-label" for="password-confirm">确认新密码</label>
                                <input
                                    tabindex="3"
                                    id="password-confirm"
                                    name="password-confirm"
                                    type="password"
                                    autocomplete="new-password"
                                    placeholder="请再次输入新密码"
                                    aria-label="确认新密码"
                                    aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                />
                            </div>

                            <button tabindex="4" class="workmate-submit" name="login" id="kc-login" type="submit">
                                <span class="workmate-submit-text">确认修改</span>
                                <svg class="workmate-submit-arrow" width="20" height="20" viewBox="0 0 20 20" fill="none" aria-hidden="true">
                                    <path d="M4 10H16M16 10L10.5 4.5M16 10L10.5 15.5" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </button>
                        </form>
                    </div>
                </div>
            </section>
        </div>
    <#elseif section = "info">
    </#if>
</@layout.registrationLayout>
