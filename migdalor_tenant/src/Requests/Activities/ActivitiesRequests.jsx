import axios from "axios";

const BASE_URL = 'https://proj.ruppin.ac.il/bgroup32/test2/tar2/'
export const GetAllActivities = async () => {

    const {data} = await axios.get(BASE_URL + 'api/Activity/GetAllActivities')
    return data;
}
export const GetActivityById = async (id) => {

    const {data} = await axios.get(`${BASE_URL}api/Activity/GetActivityById/${id}`)
    return data;
}
export const GetActivitiesResidentParticipating = async (id) => {

    const {data} = await axios.get(`${BASE_URL}api/Activity/GetActivitiesResidentParticipating/${id}`)
    return data;
}
export const JoinActivity = async (activityNumber, residentNumber) => {

    const {data} = await axios.post(`${BASE_URL}api/Activity/AddParticipantToActivity/`,
        {
            activityNumber,
            residentNumber
        })
    return data;
}
export const GetParticiapntsInActivity = async (activityNumber) => {

    const {data} = await axios.get(`${BASE_URL}api/Activity/GetParticiapntsInActivity/${activityNumber}`)
    return data;
}
export const RemoveFromActivity = async (activityNumber, residentNumber) => {

    const {data} = await axios.delete(`${BASE_URL}api/Activity/RemoveParticipantFromActivity`,
        {
            headers: {
            },
            data: {
                activityNumber,
                residentNumber
            }
        }
       )
    return data;
}