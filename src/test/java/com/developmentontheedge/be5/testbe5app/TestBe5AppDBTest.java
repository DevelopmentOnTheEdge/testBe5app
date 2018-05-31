package com.developmentontheedge.be5.testbe5app;

import com.developmentontheedge.be5.server.ServerModule;
import com.developmentontheedge.be5.modules.core.CoreModule;
import com.developmentontheedge.be5.test.TestUtils;
import com.google.inject.Injector;
import com.google.inject.util.Modules;


public abstract class TestBe5AppDBTest extends TestUtils
{
    private static final Injector injector = initInjector(
            Modules.override(new ServerModule(), new CoreModule()).with(new TestProjectProviderModule())
    );

    static {
        initDb(injector);
    }

    @Override
    public Injector getInjector()
    {
        return injector;
    }
}
