using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class PlayerInteraction : MonoBehaviour
{

    private void Start()
    {
        Application.targetFrameRate = 60;
    }
    private void OnTriggerEnter(Collider other)
    {

        Collider triggerCollider = GetComponent<Collider>();

        if (other.CompareTag("Enemy"))
        {
            Vector3 triggerObjectSize = triggerCollider.transform.localScale;
            Vector3 otherObjectSize = other.bounds.size;

            //I want to know if I'm bigger or smaller than the Enemy I'm touching.
            if (triggerObjectSize.x > otherObjectSize.x)
            {
                Debug.Log("I'm bigger");

                //consider object pooling instead of destroying/creating
                Destroy(other.gameObject);

                float amountToChange = otherObjectSize.x / 2;
                Debug.Log("WHAT? " + triggerCollider.transform.localScale);

                triggerCollider.transform.localScale = new Vector3(amountToChange + triggerCollider.transform.localScale.x, triggerCollider.transform.localScale.y, triggerCollider.transform.localScale.z + amountToChange);



                //when I'm bigger, destroy and add some size to the player

            } else
            {
                Debug.Log("I'm smaller");

                //when I'm smaller, die (or remove size?!?)
            }
        } 
    }
}
