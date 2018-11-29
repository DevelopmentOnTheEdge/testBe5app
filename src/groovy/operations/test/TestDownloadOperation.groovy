package test

import com.developmentontheedge.be5.base.model.GDynamicPropertySetSupport
import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.operation.model.Operation
import com.developmentontheedge.be5.server.operations.support.DownloadOperationSupport
import com.developmentontheedge.be5.server.util.RequestUtils
import com.developmentontheedge.be5.web.Response
import com.google.common.net.MediaType

import java.nio.charset.StandardCharsets

class TestDownloadOperation extends DownloadOperationSupport implements Operation
{
    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception
    {
        //return null
        def params = new GDynamicPropertySetSupport()
        params.add {
            name = "name"
            DISPLAY_NAME = "Имя"
        }

        return DpsUtils.setValues(params, presetValues)
    }

    @Override
    void invokeWithResponse(Response res, Object parameters)
    {
        def params = (GDynamicPropertySetSupport) parameters
        String text = "test: "
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(text.getBytes(StandardCharsets.UTF_8))
        RequestUtils.sendFile(res, true, "test.txt", MediaType.PLAIN_TEXT_UTF_8.type(),
                StandardCharsets.UTF_8.name(), byteArrayInputStream)
    }
}
