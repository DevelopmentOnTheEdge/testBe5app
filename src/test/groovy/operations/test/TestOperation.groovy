package operations.test

import com.developmentontheedge.be5.metadata.RoleType
import com.developmentontheedge.be5.operation.OperationStatus
import com.developmentontheedge.be5.testbe5app.TestBe5AppDBTest
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
        def second = executeOperation("testtable", "Test 1D", "TestOperation", "", [name:"test", beginDate: '2017-12-20']).getSecond()

        assertEquals OperationStatus.FINISHED, second.getStatus()
        assertEquals "test message", second.getMessage()
    }
}
