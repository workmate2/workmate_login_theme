<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
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
                        <span class="workmate-brand-version">v0.1.0</span>
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
            <section class="workmate-auth-panel" aria-labelledby="login-title">
                <div class="workmate-auth-card">
                    <div class="workmate-auth-inner">
                        <h1 id="login-title" class="workmate-title">欢迎使用 WorkMate</h1>
                        <p class="workmate-subtitle">登录您的账号，开始智能协作</p>

                        <form id="kc-form-login" class="workmate-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <div class="workmate-field">
                                <label class="workmate-field-label" for="username">账号</label>
                                <input
                                    tabindex="1"
                                    id="username"
                                    name="username"
                                    value="${(login.username!'')}"
                                    type="text"
                                    autofocus
                                    autocomplete="username"
                                    placeholder="请输入账号名称 / 账号ID"
                                    aria-label="${msg('username')}"
                                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                />
                            </div>

                            <div class="workmate-field">
                                <div class="workmate-field-label-row">
                                    <label class="workmate-field-label" for="password">密码</label>
                                    <#if realm.resetPasswordAllowed>
                                        <a class="workmate-forgot-inline" href="${url.loginResetCredentialsUrl}">忘记密码？</a>
                                    </#if>
                                </div>
                                <input
                                    tabindex="2"
                                    id="password"
                                    name="password"
                                    type="password"
                                    autocomplete="current-password"
                                    placeholder="请输入登录密码"
                                    aria-label="${msg('password')}"
                                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                />
                            </div>

                            <#assign fieldError = messagesPerField.existsError('username','password')/>
                            <#assign pageMsg = (message?? && !fieldError)!false/>
                            <#if fieldError || pageMsg>
                            <div class="workmate-error" aria-live="polite">
                                <svg class="workmate-error-icon" width="20" height="20" viewBox="0 0 20 20" fill="none" aria-hidden="true">
                                    <circle cx="10" cy="10" r="10" fill="#FEF2F2"/>
                                    <path d="M10 5V11" stroke="#DC2626" stroke-width="2" stroke-linecap="round"/>
                                    <circle cx="10" cy="14.5" r="1.2" fill="#DC2626"/>
                                </svg>
                                <span><#if fieldError>${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}<#else>${kcSanitize(message.summary)?no_esc}</#if></span>
                            </div>
                        </#if>

                            <#if realm.rememberMe && !usernameHidden??>
                                <label class="workmate-check" for="rememberMe">
                                    <#if login.rememberMe??>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                    <#else>
                                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox">
                                    </#if>
                                    <span class="workmate-check-box" aria-hidden="true"></span>
                                    <span class="workmate-check-text">记住我</span>
                                </label>
                            </#if>

                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                            <button tabindex="4" class="workmate-submit" name="login" id="kc-login" type="submit">
                                <span class="workmate-submit-text">${msg("doLogIn")}</span>
                                <svg class="workmate-submit-arrow" width="20" height="20" viewBox="0 0 20 20" fill="none" aria-hidden="true">
                                    <path d="M4 10H16M16 10L10.5 4.5M16 10L10.5 15.5" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </button>
                        </form>

                        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                            <div class="workmate-register">
                                <span>还没有账号？</span>
                                <a href="${url.registrationUrl}">立即注册</a>
                            </div>
                        </#if>
                    </div>
                </div>
            </section>
        </div>
    <#elseif section = "info">
    </#if>
</@layout.registrationLayout>
