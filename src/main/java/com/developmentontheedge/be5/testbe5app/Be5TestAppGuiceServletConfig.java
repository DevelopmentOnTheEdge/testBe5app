package com.developmentontheedge.be5.testbe5app;

import com.developmentontheedge.be5.ServerModule;
import com.developmentontheedge.be5.modules.core.CoreModule;
import com.developmentontheedge.be5.servlet.TemplateModule;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.servlet.GuiceServletContextListener;


public class Be5TestAppGuiceServletConfig extends GuiceServletContextListener
{
    @Override
    protected Injector getInjector()
    {
        return Guice.createInjector(
                new ServerModule(),
                new CoreModule(),
                new TemplateModule()
        );
    }
}