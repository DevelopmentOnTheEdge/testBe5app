package operations.test

import com.developmentontheedge.be5.api.Request
import com.developmentontheedge.be5.api.services.ProjectProvider
import com.developmentontheedge.be5.env.Inject
import com.developmentontheedge.be5.model.FormPresentation
import com.developmentontheedge.be5.test.SqlMockOperationTest
import org.junit.Test

import static org.junit.Assert.assertEquals

class TestExtend extends SqlMockOperationTest
{
    @Inject ProjectProvider projectProvider
    @Test
    void testGet()
    {
        projectProvider.reloadProject()

        Request req = getSpyMockRecForOp("testtable", "Test 1D", "TestExtendGroovy", "remoteAddr",
                "", ["remoteAddr":"199.168.0.1"])

        FormPresentation first = operationService.generate(req).getFirst()

//        assertEquals("{'values':{'newValue':'199.168.0.1'},'meta':{'/newValue':{'displayName':'Новое значение:'}},'order':['/newValue']}",
//                oneQuotes(first.getBean().toString()))
    }

}
