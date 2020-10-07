from API.utils.aws.get_users import get_user_detail
from student_path.student_onboard_stage.models import StudentOnboardStage
from Student.student_path_info.student_path_info_model import StudentPathInfo


def update_student_details_in_db(student_uuid):
    """
    Update the student details in various tables
    """
    # Get user details from Cognito
    res = get_user_detail(student_uuid)[0]
    
    # Update student onboard stage table
    StudentOnboardStage.objects.filter(student_uuid=student_uuid).update(first_name=res['first_name'],
                                                                        last_name=res['last_name'],
                                                                        email=res['email'])

    # Update student path info
    StudentPathInfo.objects.filter(student=student_uuid).update(first_name=res['first_name'],
                                                                last_name=res['last_name'],
                                                                email=res['email'])



