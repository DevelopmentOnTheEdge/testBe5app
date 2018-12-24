package com.developmentontheedge.be5.testbe5app;

import com.codahale.metrics.jmx.JmxReporter;
import com.developmentontheedge.be5.modules.core.CoreModule;
import com.developmentontheedge.be5.modules.monitoring.MetricsModule;
import com.developmentontheedge.be5.server.ScopedServerModule;
import com.developmentontheedge.be5.server.servlet.Be5ServletListener;
import com.developmentontheedge.be5.server.servlet.TemplateModule;
import com.google.inject.AbstractModule;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.util.Modules;

import static com.developmentontheedge.be5.modules.monitoring.Metrics.METRIC_REGISTRY;


public class Be5TestAppGuiceServletConfig extends Be5ServletListener
{
    @Override
    protected Injector getInjector()
    {
        return Guice.createInjector(getStage(),
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
            install(new MetricsModule());

            final JmxReporter reporter = JmxReporter.forRegistry(METRIC_REGISTRY).build();
            reporter.start();
        }
    }
}
