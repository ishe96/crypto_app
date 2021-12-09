import { StatusBar } from "expo-status-bar";
import React from "react";
import { CryptoDetail, Transaction } from "./screens";
import { StyleSheet, Text, View } from "react-native";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";

import Tabs from "./navigation/tabs";

const Stack = createStackNavigator();

export default function App() {
    return (
        <>
            <StatusBar style="light" />
            <NavigationContainer>
                <Tabs />
            </NavigationContainer>
        </>
    );
}
