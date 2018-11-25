package com.developmentontheedge.be5.testbe5app;

import com.developmentontheedge.be5.modules.core.CoreModule;
import com.developmentontheedge.be5.modules.core.services.LoginService;
import com.developmentontheedge.be5.modules.core.services.impl.CryptoLoginService;
import com.developmentontheedge.be5.server.ScopedServerModule;
import com.developmentontheedge.be5.server.servlet.Be5GuiceServletContextListener;
import com.developmentontheedge.be5.server.servlet.TemplateModule;
import com.google.inject.AbstractModule;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Scopes;
import com.google.inject.util.Modules;


public class Be5TestAppGuiceServletConfig extends Be5GuiceServletContextListener
{
    @Override
    protected Injector getInjector()
    {
        return Guice.createInjector(
                Modules.override(
                        new CoreModule()
                ).with(new Be5TestAppModule()),
                new ScopedServerModule(),
                new TemplateModule()
        );
    }

    private static class Be5TestAppModule extends AbstractModule
    {
        @Override
        protected void configure()
        {
            bind(LoginService.class).to(CryptoLoginService.class).in(Scopes.SINGLETON);
        }
    }
}
