package ${package}.${artifactId};

import com.codahale.metrics.jmx.JmxReporter;
import com.developmentontheedge.be5.modules.core.CoreModule;
import com.developmentontheedge.be5.modules.core.CoreServletModule;
import com.developmentontheedge.be5.modules.monitoring.MetricsModule;
import com.developmentontheedge.be5.web.WebModule;
import com.developmentontheedge.be5.server.servlet.Be5ServletListener;
import com.developmentontheedge.be5.server.servlet.TemplateModule;
import com.google.inject.AbstractModule;
import com.google.inject.Guice;
import com.google.inject.Injector;

import static com.developmentontheedge.be5.modules.monitoring.Metrics.METRIC_REGISTRY;


public class Be5TestAppGuiceServletConfig extends Be5ServletListener
{
    @Override
    protected Injector getInjector()
    {
        return Guice.createInjector(getStage(), new Be5TestAppModule());
    }

    private static class Be5TestAppModule extends AbstractModule
    {
        @Override
        protected void configure()
        {
            install(new CoreModule());
            install(new CoreServletModule());
            install(new WebModule());
            install(new TemplateModule());
            install(new MetricsModule());

            final JmxReporter jmxReporter = JmxReporter.forRegistry(METRIC_REGISTRY).build();
            jmxReporter.start();

//            final Graphite graphite = new Graphite(new InetSocketAddress("127.0.0.1", 2003));
//            final GraphiteReporter graphiteReporter = GraphiteReporter.forRegistry(METRIC_REGISTRY)
//                    .prefixedWith("testApp.com")
//                    .convertRatesTo(TimeUnit.SECONDS)
//                    .convertDurationsTo(TimeUnit.MILLISECONDS)
//                    .filter(MetricFilter.ALL)
//                    .build(graphite);
//            graphiteReporter.start(1, TimeUnit.MINUTES);
        }
    }
}
