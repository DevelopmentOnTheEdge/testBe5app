package com.developmentontheedge.be5.testbe5app;

import com.developmentontheedge.be5.query.model.beans.QRec;
import org.junit.Assert;
import org.junit.Test;
import services.TestRecords;

import javax.inject.Inject;
import java.util.Collections;
import java.util.List;

public class TestRecordTest extends TestBe5AppDBTest
{
    @Inject private TestRecords testRecords;

    @Test
    public void name()
    {
        List<QRec> recs = testRecords.recsForUser("Guest");
        Assert.assertEquals(Collections.emptyList(), recs);
    }
}
