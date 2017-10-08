package operations.test

import com.developmentontheedge.be5.api.Request
import com.developmentontheedge.be5.model.FormPresentation
import com.developmentontheedge.be5.test.SqlMockOperationTest
import org.junit.Test

import static org.junit.Assert.assertEquals

class TestExtend extends SqlMockOperationTest
{
    @Test
    void testGet()
    {
        Request req = getSpyMockRecForOp("_system_", "Session variables", "SessionVariablesEdit", "remoteAddr",
                "", ["remoteAddr":"199.168.0.1"])
        FormPresentation first = operationService.generate(req).getFirst()

//        assertEquals("{'values':{'test':''},'meta':{'/test':{'displayName':'Test'}},'order':['/test']}",
//                oneQuotes(first.getBean().toString()))
    }

}
