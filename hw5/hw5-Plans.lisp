
(in-microtheory TravelPlansMt)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; If you are less than 2 miles away, walk
(preconditionForMethod
 (and
  (distanceBetween ?pointA ?pointB ?distance)
  (lessThan ?distance 2))

 (methodForAction
  (travel ?pointA ?pointB)
  (actionSequence
   (TheList
    (doAgentPlan
     (walk ?pointA ?pointB))))))


;;; If you are between 2 and 200 miles away, take a bus
(preconditionForMethod
 (and
  (distanceBetween ?pointA ?pointB ?distance)
  (greaterThanOrEqualTo ?distance 2)
  (lessThan ?distance 200))
 
 (methodForAction
  (travel ?pointA ?pointB)
  (actionSequence
   (TheList
    (doAgentPlan
     (takeBus ?pointA ?pointB))))))


;;; If you are between 200 and 500 miles away, take a train
(preconditionForMethod
 (and
  ;;; TODO: fill in preconditions
  (distanceBetween ?pointA ?pointB ?distance)
  (greaterThanOrEqualTo ?distance 200)
  (lessThan ?distance 500))
 
 (methodForAction
  (travel ?pointA ?pointB)
  (actionSequence
   (TheList
    (doAgentPlan
     (takeTrain ?pointA ?pointB))
     ))))

;;; If you are more than 500 miles away, fly
(preconditionForMethod
 (and
  ;;; TODO: fill in preconditions
  ;;; I used greaterThanOrEqualTo instead of greaterThan
  ;;; because otherwise 500 will not be considered for any case. 
  (distanceBetween ?pointA ?pointB ?distance)
  (greaterThanOrEqualTo ?distance 500))
 
 (methodForAction
  (travel ?pointA ?pointB)
  (actionSequence
   (TheList
    (doAgentPlan
     (fly ?pointA ?pointB))))))




;;; walk
(preconditionForMethod
 (and (true))
 (methodForAction
  (walk ?pointA ?pointB)
  (actionSequence
   (TheList
    (doRecord (ist-Information MyTravelMt (walk ?pointA ?pointB)))))))

;;; fly #1; you are not at an airport
(preconditionForMethod
 (and
  (closestAirport ?pointA ?airport)
  (different ?pointA ?airport))
 
 (methodForAction
  (fly ?pointA ?pointB)
  (actionSequence
   (TheList
    (doAgentPlan
     (travel ?pointA ?airport))
    (doAgentPlan
     (travel ?airport ?pointB))))))

;;; fly #2; your endpoint is not an airport
(preconditionForMethod
 (and
  (closestAirport ?pointA ?pointA)
  ;;; TODO: fill in preconditions
  (closestAirport ?pointB ?airport)
  (different ?pointB ?airport))
 
 (methodForAction
  (fly ?pointA ?pointB)
  (actionSequence
   (TheList
    (doAgentPlan
     (fly ?pointA ?airport))
    (doAgentPlan
     ;;; TODO: fill in subtask(s)
     (travel ?airport ?pointB))))))


;;; fly #3; between airports
(preconditionForMethod
 (and
  (closestAirport ?pointA ?pointA)
  (closestAirport ?pointB ?pointB))
 
 (methodForAction
  (fly ?pointA ?pointB)
  (actionSequence
   (TheList
    (doRecord (ist-Information MyTravelMt (fly ?pointA ?pointB)))))))

;;; bus #1, you are not at a bus stop
(preconditionForMethod
 (and
  (closestBusStop ?pointA ?stop)
  (different ?pointA ?stop))
 
 (methodForAction
  (takeBus ?pointA ?pointB)
  (actionSequence
   (TheList
    (doAgentPlan
     ;;; TODO: fill in subtask
     (travel ?pointA ?stop))
    (doAgentPlan
     ;;; TODO: fill in subtask
     (travel ?stop ?pointB))))))

;;; bus #2, your endpoint is not a bus stop
(preconditionForMethod
 (and
  ;;; TODO: fill in preconditions
  (closestBusStop ?pointA ?pointA)
  (closestBusStop ?pointB ?stop)
  (different ?pointB ?stop))
 
 (methodForAction
  (takeBus ?pointA ?pointB)
  (actionSequence
   (TheList
    (doAgentPlan
     (takeBus ?pointA ?stop))
    (doAgentPlan
     (travel ?stop ?pointB))
    
     ))))

;;; bus #3; between bus stops
(preconditionForMethod
 (and
  (closestBusStop ?pointA ?pointA)
  (closestBusStop ?pointB ?pointB))
 
 (methodForAction
  (takeBus ?pointA ?pointB)
  (actionSequence
   (TheList
    (doRecord (ist-Information MyTravelMt (takeBus ?pointA ?pointB)))))))

;;; train #1; you are not at a train station
(preconditionForMethod
 (and
  ;;; TODO: fill in preconditions
  (closestTrainStation ?pointA ?station)
  (different ?pointA ?station))
 
 (methodForAction
  (takeTrain ?pointA ?pointB)
  (actionSequence
   (TheList
    (doAgentPlan
     (travel ?pointA ?station))
    (doAgentPlan
     (travel ?station ?pointB))
    
     ))))

;;; train #2; your endpoint is not a train station
(preconditionForMethod
 (and
      (closestTrainStation ?pointA ?pointA)
      (closestTrainStation ?pointB ?station)
      (different ?pointB ?station)
            
      )
 (methodForAction
  (takeTrain ?pointA ?pointB)
  (actionSequence
   (TheList
    (doAgentPlan
     (takeTrain ?pointA ?station))
    (doAgentPlan
     (travel ?station ?pointB))
    
     ))))


;;; train #3; between bus stops
(preconditionForMethod
 (and
     ;;; TODO: fill in preconditions
  (closestTrainStation ?pointA ?pointA)
  (closestTrainStation ?pointB ?pointB))
 (methodForAction
  (takeTrain ?pointA ?pointB)
  (actionSequence
   (TheList
    (doRecord (ist-Information MyTravelMt (takeTrain ?pointA ?pointB)))))))










;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; End of Code
