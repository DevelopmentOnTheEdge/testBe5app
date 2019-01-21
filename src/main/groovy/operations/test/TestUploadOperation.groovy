package operations.test

import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.groovy.GDynamicPropertySetSupport
import com.developmentontheedge.be5.operation.Operation
import com.developmentontheedge.be5.server.operations.support.OperationSupport

class TestUploadOperation extends OperationSupport implements Operation
{
    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception
    {
        def params = new GDynamicPropertySetSupport()
        params.add {
            TYPE = File
            name = "name"
            DISPLAY_NAME = "Имя"
        }

        return DpsUtils.setValues(params, presetValues)
    }

    @Override
    void invoke(Object parameters)
    {
        def item = getFileItem("name")
        File writeFile = new File(System.getProperty("user.dir") + "/target/" + item.getName())
        item.write(writeFile)
        setResultFinished()
    }
}
