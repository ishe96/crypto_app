import React from "react";
import {
    SafeAreaView,
    StyleSheet,
    View,
    Text,
    TouchableOpacity,
} from "react-native";

const CryptoDetail = ({ navigation }) => {
    return (
        // <SafeAreaView>
            <View style={styles.container}>
                <Text>CryptoDetail</Text>
                <TouchableOpacity>
                    <Text>Navigate to Transaction</Text>
                </TouchableOpacity>
            </View>
        // {/* </SafeAreaView> */}
    );
};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        alignItems: "center",
        justifyContent: "center",
    },
    shadow: {
        shadowColor: "#000",
        shadowOffset: {
            width: 0,
            height: 4,
        },
        shadowOpacity: 0.3,
        shadowRadius: 4.65,
        elevation: 8,
    },
});

export default CryptoDetail;
