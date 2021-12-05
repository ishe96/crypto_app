import { StatusBar } from "expo-status-bar";
import React from "react";
import {CryptoDetail, Transaction} from './screens';
import { StyleSheet, Text, View } from "react-native";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";

import Tabs from "./navigation/tabs";

const Stack = createStackNavigator();

const MainApp = () => {
    return (
        <NavigationContainer>
            <Stack.Navigator
              screenOptions={{headerShown:false}}
              initialRouteName={'Home'}
            >
                <Stack.Screen name="Home" component={Tabs} />

                <Stack.Screen name="CryptoDetail" component={CryptoDetail} />

                <Stack.Screen name="Transaction" component={Transaction} />
            </Stack.Navigator>
        </NavigationContainer>
    );
}

export default MainApp