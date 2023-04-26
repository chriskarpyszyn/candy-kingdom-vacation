using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraMovement : MonoBehaviour
{

    public Transform target;
    public Vector3 offset;
    public float followSpeed = 3f;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    //todo-ck what is the difference between update and lateupdate?
    void LateUpdate()
    {
        if (target != null)
        {
            Vector3 followPosition = target.position + offset;
            transform.position = Vector3.Lerp(transform.position, followPosition, followSpeed*Time.deltaTime);
        }
    }
}
