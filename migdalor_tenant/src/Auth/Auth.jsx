import React, { createContext, useState } from 'react';
import axios from 'axios';

export const UserContext = createContext();

export const UserProvider = ({ children }) => {
    const [user, setUser] = useState(null);
    const login = async (username, password) => {
        try {
            const response = await axios.post('https://proj.ruppin.ac.il/bgroup32/test2/tar2/api/login/ResidentLogin', {
                username,
                password,
            });
            const { token, resident  } = response.data;
            localStorage.setItem('token', token);
            setUser(resident);
            console.log(resident)
        } catch (error) {
            throw new Error('Login failed');
        }
    };

    // Function to handle user logout
    const logout = () => {
        localStorage.removeItem('token');
        setUser(null);
    };

    // Value to be passed to provider
    const contextValue = {
        user,
        login,
        logout,
    };

    return (
        <UserContext.Provider value={contextValue}>
            {children}
        </UserContext.Provider>
    );
};
