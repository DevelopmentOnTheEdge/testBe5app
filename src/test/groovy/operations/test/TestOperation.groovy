package operations.test

import com.developmentontheedge.be5.metadata.RoleType
import com.developmentontheedge.be5.operation.OperationStatus
import com.developmentontheedge.be5.testbe5app.TestBe5AppDBTest
import com.developmentontheedge.beans.json.JsonFactory
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.assertEquals


class TestOperation extends TestBe5AppDBTest
{
    @Before
    void setUp(){
        initUserWithRoles(RoleType.ROLE_ADMINISTRATOR)
    }

    @Test
    void test()
    {
        Object first = generateOperation("testtable", "Test 1D", "TestOperation", "").getFirst()

        assertEquals("{" +
                "'values':{'name':'','beginDate':''}," +
                "'meta':{'/name':{'displayName':'Имя'},'/beginDate':{'displayName':'Дата начала','type':'Date'}}," +
                "'order':['/name','/beginDate']" +
            "}", oneQuotes(JsonFactory.bean(first)))

        def second = executeOperation("testtable", "Test 1D", "TestOperation", "", [name:"test", beginDate: '2017-12-20']).getSecond()

        assertEquals OperationStatus.FINISHED, second.getStatus()
        assertEquals "test message", second.getMessage()
    }

}
