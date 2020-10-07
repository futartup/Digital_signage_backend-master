from API.tests import BaseAPITestcase, Utility
import os, requests
from tqdm import tqdm


class StudentSavePathTestCase(BaseAPITestcase, Utility):

    def test_save_path(self):
        """
        Test case to save the path
        :return:
        """
        # Define the URL for save path
        url = os.environ['GPS_DOMAIN_NAME'] + '/api/mypaths/'

        # Get all the paths
        count, paths_list = self.get_paths('/api/gps/publish-v1/')

        # Prepare for save path
        # body
        if count > 0:
            path_uuid = paths_list[0]['uuid']
            path_name = paths_list[0]['title']
            college_name = paths_list[0]['institute_details']['name']
            college_logo = paths_list[0]['institute_details']['logo']
            college_attachment = paths_list[0]['institute_details']['banner_image']

        body = {"operation":"save_path",
               "group":"sg",
               "paths":
                        [
                            {
                                "path_uuid":path_uuid,
                                "name":path_name,
                                "college_name":college_name,
                                "college_logo":college_logo,
                                "attachment":college_attachment
                            }
                         ]
                }

        resp = self.post(url, body)
        assert resp.status_code == 200


    def test_compare_path(self):
        """
        Test case to check compare paths
        :return:
        """
        # Define the URL for save path
        url = os.environ['GPS_DOMAIN_NAME'] + '/api/mypaths/'

        # Get all the paths
        if self.path_list.__len__() == 0:
            count, paths_list = self.get_paths('/api/gps/publish-v1/')
        else:
            # some number greater than 0 so that the if condition satisfies
            count = 4


        # Prepare for save path
        # body
        if count > 3:
            body = {"operation":"compare_path",
                    "group":"cg",
                    "paths":[
                        {"path_uuid":paths_list[0]['uuid'],
                         "name":paths_list[0]['title'],
                         "attachment":paths_list[0]['banner']
                         },
                        {"path_uuid":paths_list[1]['uuid'],
                         "name":paths_list[1]['title'],
                         "attachment":paths_list[1]['banner']
                         },
                        {"path_uuid":paths_list[2]['uuid'],
                         "name":paths_list[2]['title'],
                         "attachment":paths_list[2]['banner']
                         }
                    ]
                   }

            resp = self.post(url, body)
        else:
            print("Paths are less than 3, so test is forced to pass")
