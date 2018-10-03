package com.developmentontheedge.be5.testbe5app;

import com.developmentontheedge.be5.modules.core.CoreModule;
import com.developmentontheedge.be5.server.ScopedServerModule;
import com.developmentontheedge.be5.server.servlet.Be5GuiceServletContextListener;
import com.developmentontheedge.be5.server.servlet.TemplateModule;
import com.google.inject.Guice;
import com.google.inject.Injector;


public class Be5TestAppGuiceServletConfig extends Be5GuiceServletContextListener
{
    @Override
    protected Injector getInjector()
    {
        return Guice.createInjector(
                new CoreModule(),
                new ScopedServerModule(),
                new TemplateModule()
        );
    }
}
