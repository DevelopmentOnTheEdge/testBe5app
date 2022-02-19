package ${package}.${artifactId};

import com.developmentontheedge.be5.jetty.EmbeddedJetty;

public class Be5TestAppMain
{
    public static void main(String... args)
    {
        new EmbeddedJetty().run();
    }
}
