import {styled} from "@mui/system";
import theme from "../Theme/Theme.jsx";
import BackButton from "./BackButton.jsx";
import {Button, Typography} from "@mui/material";
import React, {useContext, useEffect, useState} from "react";
import {UserContext} from "../Auth/Auth.jsx";
import * as InitiativesRequests from "../Requests/Initatives/InitativesRequests.jsx";
import InitiativesTable from "./InitiativesTable.jsx";
import InitiativeCreateModal from "./InitiativeCreateModal.jsx";
import InitiativeEditModal from "./InitiativeEditModal.jsx";
import {Message} from "@mui/icons-material";
import MessageModal from "./MessageModal.jsx";

const StyledBox = styled('Box')({
    position: 'fixed',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    marginTop: '3rem',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    flexDirection: 'column',
    backgroundColor: theme.palette.primary.main,
    width: '75%',
    height: '500px',
    borderRadius: 20

});


const Initiatives = () => {
    const [myInitiatives, setMyInitiatives] = useState([]);
    const [open, setOpen] = useState(false)
    const [edit, setEdit] = useState(0)


    const {user} = useContext(UserContext);

    const getInitiativesCreatedByMe = async () =>{
       const initiatives =  await InitiativesRequests.GetAllInitiatives();
       setMyInitiatives(
           initiatives.filter((init) => init.residentNumber === user.id)
       )
    }

    const toggleModal = ()=> setOpen(!open)
    const openEdit =  (activityNumber) =>{
         setEdit(activityNumber);
    }
   const closeEdit =  () =>{
         setEdit(0);
    }

    useEffect(() => {
        getInitiativesCreatedByMe();
    }, [open,edit]);

    return (
        <div>
            <BackButton/>
            <StyledBox>
                <Typography variant={"h2"}
                >היוזמות שלי</Typography>
                <InitiativesTable initiatives={myInitiatives} openEdit={openEdit}/>
                <Button color="success" variant="contained" onClick={toggleModal}> יצירת יוזמה </Button>

            </StyledBox>
            <InitiativeCreateModal open={open}  onClose={toggleModal}/>
            <InitiativeEditModal open={edit!==0} edit={edit}  onClose={closeEdit}/>
        </div>
    )
}

export default Initiatives;