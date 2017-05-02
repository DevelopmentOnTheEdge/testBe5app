import com.developmentontheedge.be5.metadata.exception.ProjectLoadException;
import com.developmentontheedge.be5.metadata.model.Module;
import com.developmentontheedge.be5.metadata.model.base.BeModelCollection;
import com.developmentontheedge.be5.test.AbstractProjectTestH2DB;
import org.junit.Test;

import java.io.IOException;
import java.net.URISyntaxException;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

public class LoadTest extends AbstractProjectTestH2DB
{

    @Test
    public void testLoad() throws IOException, URISyntaxException, ProjectLoadException
    {
        assertEquals("testBe5app", sp.getProject().getAppName());

        BeModelCollection<Module> modules = sp.getProject().getModules();

        assertTrue(modules.get("core") != null);
    }
}
