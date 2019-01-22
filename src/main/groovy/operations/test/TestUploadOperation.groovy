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
            name = "files"
            DISPLAY_NAME = "Имя"
            MULTIPLE_SELECTION_LIST = true
        }

        return DpsUtils.setValues(params, presetValues)
    }

    @Override
    void invoke(Object parameters)
    {
        String[] files = params.getValue("files")
        for (String file : files) {
            def fileItem = getFileItem(file)
            File writeFile = new File(System.getProperty("user.dir") + "/target/" + fileItem.getName())
            fileItem.write(writeFile)
        }
        setResultFinished()
    }
}
