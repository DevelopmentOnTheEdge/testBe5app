package operations.test

import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.server.operations.support.GOperationSupport

class TestUploadOperation extends GOperationSupport
{
    @Override
    Object getParameters(Map<String, Object> presetValues) throws Exception
    {
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
