package operations.test

import com.developmentontheedge.be5.databasemodel.util.DpsUtils
import com.developmentontheedge.be5.server.operations.support.GOperationSupport
import groovy.transform.TypeChecked

@TypeChecked
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
        String[] fileNames = (String[]) params.getValue("files")
        for (String file : fileNames) {
            def fileItem = getFileItem(file)
            File writeFile = new File(System.getProperty("user.dir") + "/target/" + fileItem.getName())
            fileItem.write(writeFile)
            fileItem.delete()
        }

//        File[] files = (File[]) params.getValue("files")
//        for (File file : files) {
//            File writeFile = new File(System.getProperty("user.dir") + "/target/" + file.getName())
//            Files.copy(file.toPath(), writeFile.toPath())
//        }

        setResultFinished()
    }

//    public <T extends DynamicPropertySet> T setValuesWithFiles(T dps, Map<String, ?> values)
//    {
//        DpsUtils.setValues(dps, values);
//        for (DynamicProperty property : dps)
//        {
//            if (property.getType() == File.class && property.getValue() != null)
//            {
//                if (property.getValue() instanceof String[])
//                {
//                    String[] fileNames = (String[]) property.getValue();
//                    File[] files = new File[fileNames.length];
//                    for (int i = 0; i < fileNames.length; i++)
//                    {
//                        files[i] = ((DiskFileItem) getFileItem(fileNames[i])).getStoreLocation();
//                    }
//                    property.setValue(files);
//                }
//                else
//                {
//                    File file = ((DiskFileItem) getFileItem((String) property.getValue())).getStoreLocation();
//                    if ((boolean) property.getAttribute(BeanInfoConstants.MULTIPLE_SELECTION_LIST))
//                    {
//                        property.setValue(new File[]{file});
//                    }
//                    else
//                    {
//                        property.setValue(file);
//                    }
//                }
//            }
//        }
//        return dps;
//    }
}
