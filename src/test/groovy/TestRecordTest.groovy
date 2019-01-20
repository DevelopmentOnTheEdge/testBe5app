import com.developmentontheedge.be5.testbe5app.TestBe5AppDBTest
import com.developmentontheedge.be5.testbe5app.TestRecords
import org.junit.Assert
import org.junit.Test

import javax.inject.Inject

class TestRecordTest extends TestBe5AppDBTest
{
    @Inject TestRecords testRecords

    @Test
    void name() throws Exception
    {
        def recs = testRecords.recsForUser("Guest")
        Assert.assertEquals(Collections.emptyList(), recs)
    }
}
